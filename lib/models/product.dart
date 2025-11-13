class Product {
  final String productId;
  final String name;
  final int price;
  final String description;
  final String thumbnail;
  final String category;
  final bool isFeatured;
  final int views;
  final int likes;
  final String user;

  Product({
    required this.productId,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.views,
    required this.likes,
    required this.user,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      category: json['category'] ?? '',
      isFeatured: json['is_featured'] ?? false,
      views: json['views'] ?? 0,
      likes: json['likes'] ?? 0,
      user: json['user'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'price': price,
      'description': description,
      'thumbnail': thumbnail,
      'category': category,
      'is_featured': isFeatured,
      'views': views,
      'likes': likes,
      'user': user,
    };
  }
}