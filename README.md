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
