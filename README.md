# `football_bidding`
> Naufal Zafran Fadil - 2406402542 - PBP F

*Bid exclusive football items here!*

## Tugas 7: Elemen Dasar Flutter

### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Widget tree pada Flutter adalah struktur hierarki yang terdiri dari widget-widget yang saling terhubung. Setiap widget dapat memiliki satu atau lebih child widget, dan hubungan parent-child bekerja dengan cara parent widget mengatur tata letak, ukuran, dan perilaku child widget-nya. Parent widget bertanggung jawab untuk mengatur bagaimana child widget ditampilkan, sementara child widget dapat menerima properti dari parent-nya. Struktur ini memungkinkan Flutter untuk membangun UI secara efisien dengan cara yang deklaratif.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

- `MaterialApp`: Widget root yang menyediakan tema, navigasi, dan konfigurasi aplikasi Material Design.
- `Scaffold`: Struktur dasar halaman dengan AppBar, body, dan elemen lainnya.
- `AppBar`: Bilah atas yang menampilkan judul aplikasi.
- `Center`: Widget yang memusatkan child-nya di tengah parent.
- `Column`: Widget yang menyusun child-child-nya secara vertikal.
- `ElevatedButton.icon`: Tombol dengan ikon dan teks yang dapat ditekan.
- `Icon`: Widget untuk menampilkan ikon.
- `Text`: Widget untuk menampilkan teks.
- `SizedBox`: Widget untuk memberikan jarak antar widget.
- `ScaffoldMessenger`: Untuk menampilkan snackbar.
- `SnackBar`: Widget untuk menampilkan pesan sementara di bagian bawah layar.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Widget `MaterialApp` adalah widget root yang menyediakan konfigurasi dasar untuk aplikasi Flutter yang menggunakan Material Design. Fungsinya meliputi pengaturan tema aplikasi, navigasi antar halaman, konfigurasi lokal, dan penyediaan context untuk widget-widget lain. Widget ini sering digunakan sebagai root karena menyediakan semua fitur dasar yang diperlukan untuk aplikasi Material Design, seperti tema, routing, dan akses ke berbagai service seperti `ScaffoldMessenger`.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

`StatelessWidget` adalah widget yang tidak memiliki state internal dan tidak berubah seiring waktu. Widget ini cocok untuk elemen UI yang statis atau yang hanya bergantung pada properti eksternal. `StatefulWidget` memiliki state internal yang dapat berubah, dan menggunakan objek `State` untuk mengelola perubahan tersebut. Kita memilih `StatelessWidget` ketika UI tidak perlu berubah berdasarkan interaksi pengguna atau data dinamis, sedangkan `StatefulWidget` digunakan ketika ada kebutuhan untuk mengubah UI berdasarkan state yang berubah, seperti counter atau form input.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

`BuildContext` adalah objek yang menyediakan informasi tentang lokasi widget dalam widget tree. BuildContext penting karena digunakan untuk mengakses tema, media query, dan navigasi. Di metode `build`, BuildContext digunakan sebagai parameter untuk mengakses informasi tentang ancestor widget dan untuk membangun widget dengan benar dalam konteks yang tepat.

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload adalah fitur Flutter yang memungkinkan pengembang untuk melihat perubahan kode secara instan tanpa kehilangan state aplikasi. Hot reload mempertahankan state aplikasi dan hanya memperbarui bagian yang berubah. Hot restart, di sisi lain, melakukan restart penuh aplikasi, yang berarti state aplikasi akan hilang dan aplikasi dimulai ulang dari awal. Hot reload lebih cepat dan berguna untuk perubahan UI, sedangkan hot restart diperlukan untuk perubahan struktural seperti perubahan main function atau perubahan yang mempengaruhi inisialisasi aplikasi.

## Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

### 1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

`Navigator.push()` menambahkan halaman baru ke stack navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan tombol back. `Navigator.pushReplacement()` menggantikan halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack dan pengguna tidak dapat kembali ke sana. Pada aplikasi Football Shop, `Navigator.push()` digunakan ketika menekan tombol "Create Product" untuk membuka halaman form, karena pengguna mungkin ingin kembali ke halaman utama setelah selesai. `Navigator.pushReplacement()` bisa digunakan pada drawer navigation untuk "Home" jika kita ingin memastikan pengguna tidak bisa kembali ke halaman sebelumnya dengan back button, namun dalam kasus ini `Navigator.pop()` lebih sesuai untuk menutup drawer.

### 2. Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

`Scaffold` digunakan sebagai struktur dasar setiap halaman, menyediakan area untuk `AppBar`, `body`, dan `drawer`. `AppBar` memberikan judul halaman dan konsistensi visual di bagian atas. `Drawer` menyediakan navigasi lateral yang dapat diakses dari semua halaman, memungkinkan pengguna berpindah antar halaman dengan mudah. Dengan menggunakan hierarchy ini, aplikasi memiliki struktur yang konsisten: setiap halaman memiliki AppBar dengan judul yang relevan dan drawer yang sama, sehingga user experience menjadi lebih intuitif dan terorganisir.

### 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Layout widget seperti `Padding` memberikan ruang antar elemen untuk menghindari tampilan yang terlalu padat dan meningkatkan readability. `SingleChildScrollView` memungkinkan form dapat di-scroll jika konten melebihi tinggi layar, sehingga semua field tetap dapat diakses di device dengan layar kecil. `ListView` bisa digunakan untuk menampilkan daftar item dalam bentuk scrollable, namun dalam form ini belum digunakan. Pada aplikasi Football Shop, `Padding` digunakan di sekitar form untuk memberikan margin dari tepi layar, `SingleChildScrollView` membungkus `Column` form agar dapat di-scroll, dan `SizedBox` digunakan untuk memberikan jarak vertikal antar field input.

### 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Tema aplikasi disesuaikan dengan menggunakan `ThemeData` dengan `ColorScheme.fromSeed(seedColor: Colors.deepPurple)`, yang memberikan palet warna yang konsisten berdasarkan warna utama deep purple. `AppBar` menggunakan `Theme.of(context).colorScheme.primary` untuk warna background, sementara tombol-tombol menggunakan warna spesifik seperti biru, hijau, dan merah untuk membedakan fungsi masing-masing. Drawer header juga menggunakan `Colors.deepPurple` untuk konsistensi. Pendekatan ini memastikan semua elemen visual terintegrasi dengan brand football bidding yang sporty dan modern.

## Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

### 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model Dart dibuat untuk merepresentasikan struktur data yang konsisten dan type-safe. Saat mengambil data JSON dari API, kita perlu memastikan bahwa data tersebut sesuai dengan ekspektasi aplikasi kita. Model memberikan validasi tipe otomatis - misalnya, jika API mengirim string untuk field yang seharusnya integer, model akan menangkap error tersebut saat parsing.

Tanpa model, kita akan bekerja langsung dengan `Map<String, dynamic>` yang raw dan tidak aman. Konsekuensinya:
- **Validasi tipe**: Tidak ada jaminan bahwa field tertentu memiliki tipe yang benar, bisa menyebabkan runtime error saat mengakses data
- **Null-safety**: Sulit mendeteksi field yang null, berpotensi menyebabkan crash aplikasi
- **Maintainability**: Kode menjadi sulit dipelihara karena perubahan struktur API memerlukan perubahan di banyak tempat, dan tidak ada dokumentasi struktur data yang jelas

Dengan model, kita mendapatkan compile-time safety, auto-completion, dan kemudahan refactoring. Saat API berubah, kita tinggal update model saja.

### 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package `http` adalah library HTTP client dasar untuk Flutter yang memungkinkan kita membuat HTTP requests seperti GET, POST, PUT, DELETE ke server. Ini adalah tool low-level untuk komunikasi jaringan.

`CookieRequest` adalah wrapper khusus dari package `pbp_django_auth` yang mengelola session dan cookies secara otomatis. Ini dibuat khusus untuk integrasi dengan Django authentication system.

**Perbedaan peran:**
- `http` package: Generic HTTP client, kita harus manual mengelola cookies, headers, dan session
- `CookieRequest`: Specialized untuk Django auth, otomatis mengirim cookies session, menjaga login state, dan menyediakan method seperti `login()`, `logout()`, `postJson()`

Dalam tugas ini, `CookieRequest` digunakan untuk semua operasi yang butuh autentikasi karena mengelola session cookies secara transparan, sementara `http` bisa digunakan untuk request yang tidak butuh auth.

### 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

`CookieRequest` perlu dibagikan karena mengelola state autentikasi global aplikasi. Instance yang sama harus digunakan di seluruh app agar:
- Session cookies tetap konsisten
- Status login (`loggedIn`) akurat di semua komponen
- Tidak ada duplikasi session atau konflik autentikasi

Jika setiap komponen membuat instance `CookieRequest` sendiri, maka login di satu halaman tidak akan berlaku di halaman lain, karena cookies tidak dibagikan. Dengan menggunakan `Provider` di root aplikasi, semua widget dapat mengakses instance yang sama melalui `context.watch<CookieRequest>()`.

Ini memastikan bahwa sekali user login, seluruh aplikasi mengenali status tersebut.

### 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Untuk komunikasi Flutter-Django, diperlukan konfigurasi di sisi Django dan Android:

**Django side:**
- `ALLOWED_HOSTS = ['10.0.2.2']`: Android emulator mengakses localhost Django melalui IP 10.0.2.2 (bukan 127.0.0.1)
- CORS enabled: `django-cors-headers` dengan `CORS_ALLOWED_ORIGINS` untuk mengizinkan request dari Flutter web ports
- Cookie settings: `CORS_ALLOW_CREDENTIALS = True` untuk mengirim cookies session

**Android side:**
- `android/app/src/main/AndroidManifest.xml`: Permission `android.permission.INTERNET` untuk akses jaringan

**Konsekuensi jika tidak dikonfigurasi:**
- Tanpa ALLOWED_HOSTS: Django menolak request dengan "DisallowedHost" error
- Tanpa CORS: Browser blocks cross-origin requests, auth cookies tidak terkirim
- Tanpa internet permission: Android app tidak bisa connect ke server
- Cookie issues: Session tidak ter-maintain, user harus login terus menerus

Hasilnya aplikasi tidak bisa berkomunikasi dengan backend sama sekali.

### 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme pengiriman data:

1. **Input**: User mengisi form (nama, harga, dll) di Flutter
2. **Validasi**: Form divalidasi menggunakan `Form` dan `TextFormField` validators
3. **HTTP Request**: Data dikirim sebagai JSON via `CookieRequest.postJson()` ke Django endpoint
4. **Django Processing**: Django menerima data, validasi, simpan ke database, return response
5. **Response Handling**: Flutter menerima response, parse JSON, tampilkan success/error message
6. **UI Update**: Jika sukses, navigasi kembali ke list atau refresh data
7. **Display**: Data ditampilkan menggunakan `FutureBuilder` yang fetch dari API dan render sebagai list/grid

Proses ini memastikan data flow yang konsisten dari user input sampai tampilan akhir.

### 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

**Login Process:**
1. User input username/password di Flutter form
2. Flutter kirim POST request ke `/auth/login/` dengan credentials
3. Django authenticate user, buat session, set cookies
4. Django return JSON response dengan status dan user data
5. Flutter terima response, update `CookieRequest` state, navigasi ke menu

**Register Process:**
1. User input username/password/confirm di Flutter
2. Flutter kirim POST ke `/auth/register/` dengan data
3. Django buat user baru, validasi, return success/error
4. Flutter tampilkan message, redirect ke login jika sukses

**Logout Process:**
1. User tap logout button
2. Flutter kirim POST ke `/auth/logout/`
3. Django clear session, return success
4. Flutter clear local state, redirect ke login page

**Session Management:**
- Cookies otomatis dikirim dengan setiap request via `CookieRequest`
- Django validate session pada setiap authenticated endpoint
- Flutter check `request.loggedIn` untuk UI state

### 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

**Step 1: Setup Dependencies & Models**
- Tambah `provider`, `pbp_django_auth`, `http` ke pubspec.yaml
- Buat model `Product` dengan factory constructor `fromJson()` untuk parsing data dari Django
- Setup `Provider` di `main.dart` untuk share `CookieRequest` instance

**Step 2: Authentication System**
- Buat `LoginPage` dengan form username/password, integrasi dengan `request.login()`
- Buat `RegisterPage` dengan form lengkap, kirim ke `/auth/register/`
- Implement logout di menu dengan `request.logout()`
- Handle response parsing untuk success/error states

**Step 3: Product Management**
- Buat `ProductFormPage` dengan validasi form, kirim POST ke `/create-flutter/`
- Implement `ProductListPage` dengan `FutureBuilder` untuk fetch dari `/get-products/`
- Tambah filtering dengan parameter `?filter=user` untuk user-specific items
- Buat `ProductDetailPage` untuk tampilkan semua atribut produk

**Step 4: Navigation & UI**
- Setup drawer navigation dengan `LeftDrawer` untuk consistent menu
- Implement menu utama dengan grid buttons untuk All Products, My Products, Create Product
- Handle navigation flow: Login → Menu → Product pages
- Add proper error handling dan loading states

**Step 5: API Integration**
- Gunakan `CookieRequest` untuk semua authenticated requests
- Implement image proxy untuk external thumbnails via `/proxy-image/`
- Handle CORS dan cookie issues dengan proper Django configuration
- Add debugging logs untuk troubleshooting API calls

**Step 6: Testing & Polish**
- Test full authentication flow dari register sampai logout
- Verify product CRUD operations work correctly
- Ensure proper error messages dan user feedback
- Clean up code dan add comments untuk maintainability
