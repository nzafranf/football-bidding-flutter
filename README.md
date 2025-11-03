# `football_bidding` 
> Naufal Zafran Fadil - 2406402542 -PBP F

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
