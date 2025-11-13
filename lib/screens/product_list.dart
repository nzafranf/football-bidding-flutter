import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/left_drawer.dart';
import 'product_detail.dart';

class ProductListPage extends StatefulWidget {
  final String filter;

  const ProductListPage({super.key, required this.filter});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  Future<List<Product>> fetchProducts(CookieRequest request) async {
    try {
      print('🔄 Fetching products with filter: ${widget.filter}');
      print('🔐 Request logged in status: ${request.loggedIn}');

      if (!request.loggedIn) {
        print('❌ User not logged in, cannot fetch products');
        return [];
      }

      final response = await request.get('http://localhost:8000/get-products/?filter=${widget.filter}');
      print('📡 Raw API response: $response');
      var data = response;

      if (data is List) {
        print('✅ Received ${data.length} products from API');
        List<Product> listProducts = [];
        for (var item in data) {
          try {
            Product product = Product.fromJson(item as Map<String, dynamic>);
            print('📦 Product: ${product.name} - Thumbnail: ${product.thumbnail}');
            listProducts.add(product);
          } catch (e) {
            print('❌ Error parsing product: $e');
            print('   Raw item: $item');
          }
        }
        print('🎉 Successfully parsed ${listProducts.length} products');
        return listProducts;
      } else {
        print('❌ API response is not a List, got: ${data.runtimeType}');
        return [];
      }
    } catch (e) {
      print('💥 Network error fetching products: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filter == 'all' ? 'All Products' : 'My Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Column(
                children: [
                  Text(
                    'There are no products yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final product = snapshot.data![index];
                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: product,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  bool _isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && uri.hasAuthority;
    } catch (e) {
      print('❌ Invalid URL format: $url - Error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('🎨 Building ProductCard for: ${product.name}');
    print('   Thumbnail URL: ${product.thumbnail}');
    print('   Thumbnail isNotEmpty: ${product.thumbnail.isNotEmpty}');

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Thumbnail image
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(right: 16),
                child: product.thumbnail.isNotEmpty && _isValidUrl(product.thumbnail)
                  ? Image.network(
                      'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          print('✅ Image loaded successfully for ${product.name}');
                          return child;
                        }
                        return Container(
                          color: Colors.grey[200],
                          child: const Center(child: CircularProgressIndicator()),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        print('❌ Image load failed for product ${product.name}');
                        print('   Original URL: ${product.thumbnail}');
                        final encodedUrl = Uri.encodeComponent(product.thumbnail);
                        final proxyUrl = 'http://localhost:8000/proxy-image/?url=$encodedUrl';
                        print('   Encoded URL: $encodedUrl');
                        print('   Proxy URL: $proxyUrl');
                        print('   Error: $error');
                        print('   StackTrace: $stackTrace');

                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.broken_image, size: 40),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image, size: 30),
                          Text(
                            product.thumbnail.isEmpty ? 'No URL' : 'Invalid URL',
                            style: const TextStyle(fontSize: 8),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Price: \$${product.price}'),
                    const SizedBox(height: 4),
                    Text('Category: ${product.category}'),
                    const SizedBox(height: 4),
                    Text('By: ${product.user}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}