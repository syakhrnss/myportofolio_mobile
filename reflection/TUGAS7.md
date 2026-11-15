# Assignment 7: Flutter App Basics

## Features

### Fitur yang diwajibkan dalam tugas

- Tiga widget InfoCard di bagian atas halaman utama untuk menampilkan NPM, nama, dan kelas.
- Menu utama menggunakan widget ItemCard, dengan ikon dan warna latar yang berbeda untuk setiap tombol (Lihat Proyek, Tambah Proyek, dan Logout).
- Menampilkan SnackBar dengan pesan "Kamu telah menekan tombol [Nama Tombol]!" ketika salah satu tombol ditekan.

### Fitur tambahan

- **Halaman untuk setiap bagian:** Tombol Lihat Proyek, Lihat Experience, dan Lihat Education akan membuka halaman tersendiri yang menampilkan daftar data dalam bentuk kartu. Warna AppBar dan ikon mengikuti warna tombol yang digunakan untuk membuka halaman tersebut. Sementara itu, tombol Tambah Proyek dan Logout tidak membuka halaman baru, tetapi hanya menampilkan SnackBar.
- Menambahkan dua menu tambahan, yaitu Lihat Experience dan Lihat Education.
- Tampilan SnackBar dilengkapi dengan ikon, menggunakan warna sesuai tombol yang ditekan, dan memiliki durasi tampil yang lebih singkat.
- Halaman utama dapat di-scroll agar tampilannya tidak terpotong pada layar dengan ukuran pendek maupun dalam posisi landscape.
- Menggunakan dark theme yang disesuaikan dengan tampilan web portfolio.

## Project Structure

| File | Fungsi |
|---|---|
| lib/main.dart | Mengatur root/awal aplikasi dan tema melalui widget MyApp. |
| lib/menu.dart | Berisi MyHomePage (StatelessWidget), widget InfoCard, model ItemHomepage, dan widget ItemCard. |
| lib/section_page.dart | Berisi halaman SectionPage dan model PortfolioEntry untuk fitur tambahan. |

Warna setiap tombol disimpan di dalam model ItemHomepage, sehingga ItemCard tidak perlu mengatur warna masing-masing tombol secara terpisah.

## AI Disclosure

**Tool:** ChatGPT (OpenAI), digunakan melalui chat untuk membantu memahami kode dalam proyek Flutter ini.

**Cara penggunaan AI:** Saya menggunakan ChatGPT untuk membantu memahami bagian-bagian kode yang masih belum saya pahami dan memastikan apakah perubahan yang saya kerjakan sudah sesuai dengan instruksi tugas. Saya memberikan soal dan rubrik penilaian sebagai acuan, kemudian meminta ChatGPT untuk memeriksa apakah perubahan yang saya lakukan sudah tepat serta memberikan saran jika masih ada bagian yang perlu diperbaiki. Saya juga menggunakan ChatGPT untuk memahami fungsi widget, alur program, dan alasan penggunaan beberapa bagian kode. Namun, pengerjaan dan perubahan kode dalam proyek ini tetap saya lakukan sendiri. Saya menggunakan penjelasan dan saran dari ChatGPT sebagai bahan untuk memahami kode dan mengevaluasi hasil pekerjaan saya, bukan untuk meminta AI mengerjakan seluruh proyek.

**Bagian yang dibantu oleh AI:**

- Membantu memahami fungsi dan cara kerja widget yang digunakan dalam proyek, termasuk hubungan antar-widget.
- Membantu menyusun gambaran widget tree berdasarkan struktur kode yang sudah saya buat.
- Membantu memahami cara kerja SnackBar, termasuk penggunaan ikon, warna tombol, dan durasi tampilnya.
- Membantu memahami penggunaan SingleChildScrollView untuk mengatasi masalah tampilan yang melebihi ukuran layar.
- Membantu memahami cara kerja navigasi menuju SectionPage dan bagaimana data ditampilkan pada halaman tersebut.
- Membantu mengevaluasi apakah perubahan yang saya kerjakan sudah sesuai dengan soal dan rubrik penilaian.

**Keterbatasan AI yang saya temui:**

- Penjelasan AI terkadang masih perlu disesuaikan dengan kondisi kode yang sebenarnya, karena AI tidak selalu mengetahui keseluruhan struktur proyek.
- Saran mengenai warna dan tampilan juga belum tentu sesuai dengan desain yang saya inginkan, sehingga tetap perlu dipertimbangkan dan dicoba sendiri.

**Pekerjaan yang saya lakukan sendiri:**

- Menentukan identitas yang ditampilkan pada aplikasi, seperti NPM, nama, dan kelas.
- Memilih Experience dan Education sebagai dua menu tambahan.
- Mengerjakan perubahan kode dan menyesuaikan implementasi dengan instruksi tugas.
- Menguji aplikasi melalui Chrome, termasuk pada ukuran jendela yang pendek, untuk memastikan tampilan tidak mengalami overflow.
- Memeriksa perilaku SnackBar ketika tombol ditekan dan ketika berpindah ke halaman lain.
- Memperbaiki kesalahan penulisan nilai warna (ternyata tidak bisa pakai #) yang menyebabkan kode gagal dijalankan.
- Mencoba beberapa pilihan warna pink untuk latar InfoCard, kemudian memilih kembali warna navy-purple karena lebih mudah dibaca.
- Menentukan warna akhir tema aplikasi dengan membandingkannya dengan tampilan web portfolio.

**Log Prompting:**

**001 / 7 - Memahami fungsi dan hubungan antar-widget Flutter:** [Link ChatGPT](https://chatgpt.com/share/6af95d13-c150-83ec-ad1a-770f963368c7) Membantu saya memahami fungsi dan cara kerja widget yang digunakan dalam proyek MyPortfolio Mobile, termasuk hubungan antar-widget dalam membangun tampilan aplikasi.

**002 / 7 - Memahami perbedaan StatelessWidget dan StatefulWidget:** [Link ChatGPT](https://chatgpt.com/share/6af95d13-c150-83ec-ad1a-770f963368c7) Membantu saya memahami perbedaan StatelessWidget dan StatefulWidget, karakteristik masing-masing, serta cara kerja state dan penggunaan setState() untuk memperbarui tampilan aplikasi.

**003 / 7 - Memahami implementasi SnackBar dan SingleChildScrollView:** [Link ChatGPT](https://chatgpt.com/share/6af95d13-c150-83ec-ad1a-770f963368c7) Membantu saya memahami cara kerja SnackBar, termasuk penggunaan ikon, warna tombol, dan durasi tampilnya, serta penggunaan SingleChildScrollView untuk mengatasi tampilan yang melebihi ukuran layar.

**004 / 7 - Memahami navigasi ke SectionPage:** [Link ChatGPT](https://chatgpt.com/share/6af95d13-c150-83ec-ad1a-770f963368c7) Membantu saya memahami mekanisme navigasi menuju SectionPage dan cara data ditampilkan pada halaman tersebut.

**005 / 7 - Mengevaluasi implementasi berdasarkan rubrik dan memperoleh saran perbaikan:** [Link ChatGPT](https://chatgpt.com/share/6af95d13-c150-83ec-ad1a-770f963368c7) Membantu saya mengevaluasi hasil implementasi aplikasi berdasarkan instruksi soal dan rubrik penilaian, serta memberikan saran perbaikan agar kode dan fitur yang dibuat lebih sesuai dengan kriteria penilaian.


## Pertanyaan Reflektif

### 1. Apa yang dimaksud dengan *widget tree* pada Flutter dan bagaimana hubungan induk-anak (*parent-child*) bekerja antar-widget?

Di Flutter, seluruh tampilan aplikasi dibangun menggunakan widget. Widget-widget tersebut disusun secara bertingkat dan membentuk struktur yang disebut *widget tree*. Dalam struktur ini, satu widget dapat menjadi induk (*parent*) yang membungkus satu atau beberapa widget lainnya sebagai anak (*child*), biasanya melalui properti child atau children. Parent berperan dalam mengatur posisi dan batas ukuran child, sedangkan child menentukan bagaimana tampilannya di dalam batas tersebut. Selain itu, informasi seperti tema dan ukuran layar juga dapat diakses oleh widget yang berada di bagian bawah struktur melalui BuildContext.

Pada aplikasi ini, susunan widget tree untuk halaman utamanya kurang lebih seperti berikut:

```text
MaterialApp
└── MyHomePage
    └── Scaffold
        ├── AppBar
        │   └── Text("MyPortfolio")
        └── SingleChildScrollView
            └── Padding
                └── Column
                    ├── IntrinsicHeight
                    │   └── Row
                    │       ├── InfoCard (Card > Container > Column > Text, SizedBox, Text)
                    │       ├── InfoCard
                    │       └── InfoCard
                    ├── SizedBox
                    └── Center
                        └── Column
                            ├── Padding > Text("Selamat datang ...")
                            └── GridView.count
                                └── ItemCard x5 (Material > InkWell > Container > Center > Column > Icon, Padding, Text)
```

Pada struktur tersebut, Scaffold menjadi parent dari AppBar dan bagian body, sedangkan Column menjadi parent dari IntrinsicHeight, SizedBox, dan Center. Setiap widget juga dapat memiliki susunan parent-child sendiri, seperti InfoCard yang terdiri dari beberapa widget untuk membentuk tampilannya. Dengan struktur seperti ini, tampilan aplikasi menjadi lebih terorganisir dan setiap bagian dapat diatur sesuai kebutuhan. Perubahan pada suatu widget juga dapat memengaruhi bagian-bagian yang berada di bawahnya dalam struktur widget tree.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

| Widget | Fungsi dalam proyek |
|---|---|
| MyApp | Widget root (StatelessWidget) di main.dart yang membangun MaterialApp. |
| MaterialApp | Menyediakan tema, navigasi, dan pengaturan dasar aplikasi bergaya Material, serta menentukan halaman awal (home). |
| MyHomePage | Halaman utama (StatelessWidget) yang berisi identitas dan menu. |
| Scaffold | Kerangka halaman: menyediakan tempat untuk AppBar dan body, serta area tempat SnackBar muncul. |
| AppBar | Bar di bagian atas halaman, berisi judul "MyPortfolio" (dan judul halaman section). |
| Text | Menampilkan teks, seperti judul, nama, NPM, dan label tombol. |
| SingleChildScrollView | Membuat isi halaman bisa digulir sehingga tidak overflow di layar pendek. |
| Padding | Memberi jarak di sekeliling widget lain. |
| Column | Menyusun child secara vertikal. |
| Row | Menyusun child secara horizontal, dipakai untuk tiga InfoCard dan isi SnackBar. |
| IntrinsicHeight | Membuat ketiga InfoCard sama tinggi mengikuti kartu tertinggi. |
| SizedBox | Memberi ruang kosong dengan ukuran tetap sebagai jarak. |
| Center | Menempatkan child di tengah. |
| GridView.count | Menampilkan tombol menu dalam grid tiga kolom. |
| InfoCard | Widget buatan sendiri untuk kartu identitas (NPM, Name, Class). |
| Card | Kartu dengan sudut membulat dan bayangan, warnanya mengikuti tema. |
| Container | Kotak serbaguna untuk mengatur lebar dan padding isi kartu. |
| ItemCard | Widget buatan sendiri untuk satu tombol menu berwarna. |
| Material | Permukaan berwarna dengan sudut membulat, tempat efek ripple tergambar. |
| InkWell | Membuat area bisa ditekan (onTap) dan memberi efek ripple. |
| Icon | Menampilkan ikon pada tombol dan SnackBar. |
| Expanded | Membuat teks SnackBar mengisi sisa lebar baris agar tidak overflow. |
| SnackBar | Pesan singkat di bagian bawah layar saat tombol ditekan. |
| ScaffoldMessenger | Dipakai lewat ScaffoldMessenger.of(context) untuk menampilkan dan menyembunyikan SnackBar. |
| Navigator | Berpindah ke halaman section dan kembali (ekstra). |
| SectionPage | Widget buatan sendiri untuk halaman daftar tiap bagian (ekstra). |
| ListView.separated | Daftar yang bisa digulir dengan pemisah antar-entri (ekstra). |
| ListTile | Satu baris entri dengan ikon, judul, dan subjudul (ekstra). |
| CircleAvatar | Lingkaran berwarna sebagai latar ikon entri (ekstra). |

Selain widget di atas, proyek ini juga menggunakan dua class biasa untuk menyimpan data, yaitu ItemHomepage dan PortfolioEntry. ItemHomepage digunakan untuk menyimpan informasi setiap tombol menu, seperti nama, ikon, warna, dan daftar entri jika tersedia. Sementara itu, PortfolioEntry digunakan untuk menyimpan informasi setiap entri yang ditampilkan pada halaman bagian, berupa judul dan subjudul.

### 3. Apa fungsi dari widget MaterialApp? Mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter?

MaterialApp merupakan widget yang menjadi dasar bagi aplikasi Flutter yang menggunakan Material Design. Widget ini menyediakan berbagai pengaturan yang dibutuhkan oleh aplikasi, seperti tema melalui ThemeData, halaman awal melalui properti home, judul aplikasi, serta sistem navigasi menggunakan Navigator dan route. Selain itu, MaterialApp juga menyediakan ScaffoldMessenger yang digunakan untuk mengelola tampilan SnackBar. Dengan adanya pengaturan tersebut, widget-widget di dalam aplikasi dapat menggunakan konfigurasi yang sama tanpa harus mengaturnya satu per satu.

Dalam proyek ini, MaterialApp digunakan untuk mengatur dark theme beserta colorScheme, warna latar melalui scaffoldBackgroundColor, dan mengaktifkan Material 3 menggunakan useMaterial3: true. Widget ini juga menentukan MyHomePage sebagai halaman awal aplikasi melalui properti home. Pengaturan tersebut kemudian digunakan oleh widget lain, misalnya AppBar yang mengambil warna utama dari Theme.of(context).colorScheme.primary. Selain itu, SnackBar dapat ditampilkan melalui ScaffoldMessenger, sedangkan Navigator.of(context).push(...) digunakan untuk membuka SectionPage. Oleh karena itu, MaterialApp ditempatkan sebagai root widget karena menjadi bagian utama yang menyediakan pengaturan dan fasilitas yang dibutuhkan oleh widget-widget di bawahnya.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih masing-masing?

StatelessWidget merupakan widget yang tidak menyimpan state internal yang dapat berubah selama aplikasi berjalan. Tampilan widget ini bergantung pada data atau konfigurasi yang diberikan ketika widget dibuat. Sementara itu, StatefulWidget merupakan widget yang memiliki objek State terpisah untuk menyimpan data yang dapat berubah selama aplikasi berjalan. Ketika terjadi perubahan pada state melalui setState(), Flutter akan memanggil kembali metode build agar tampilan dapat diperbarui sesuai dengan kondisi terbaru.

StatelessWidget lebih cocok digunakan ketika suatu widget hanya bertugas menampilkan informasi dan tidak perlu mengelola perubahan state internal akibat interaksi pengguna. Sebaliknya, StatefulWidget digunakan ketika terdapat data yang bisa berubah dan perubahan tersebut perlu ditampilkan pada layar, misalnya penghitung, isi form, kotak pencarian, atau tombol yang dapat diaktifkan dan dinonaktifkan.

Dalam proyek ini, seluruh widget buatan sendiri, yaitu MyApp, MyHomePage, InfoCard, ItemCard, dan SectionPage, menggunakan StatelessWidget. Hal ini karena data yang ditampilkan bersifat tetap, seperti NPM, nama, kelas, dan daftar items yang disimpan sebagai konstanta (static const). Ketika tombol ditekan, perubahan yang terjadi berupa munculnya SnackBar atau perpindahan halaman yang ditangani oleh ScaffoldMessenger dan Navigator. Namun, jika nantinya tombol Tambah Proyek benar-benar digunakan untuk menambahkan data baru ke dalam daftar selama aplikasi berjalan, MyHomePage perlu menggunakan StatefulWidget karena data yang ditampilkan akan mengalami perubahan.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

BuildContext merupakan objek yang menunjukkan posisi suatu widget di dalam widget tree. Melalui objek ini, widget dapat mencari dan mengakses informasi atau layanan yang disediakan oleh widget-widget induknya. Misalnya, sebuah widget dapat mengambil tema aplikasi, ukuran layar, atau menggunakan navigasi yang tersedia di atasnya. Tanpa BuildContext, widget tidak dapat mengetahui secara langsung lingkungan tempatnya berada atau mencari widget induk yang menyediakan fasilitas tersebut.

Setiap metode build(BuildContext context) menerima BuildContext sebagai parameter ketika Flutter membangun tampilan widget. Dalam proyek ini, BuildContext digunakan di beberapa bagian dengan fungsi yang berbeda. Pada MyHomePage, Theme.of(context).colorScheme.primary digunakan untuk mengambil warna utama dari tema yang sudah diatur melalui MaterialApp. Pada InfoCard, MediaQuery.of(context).size.width / 3.5 digunakan untuk mendapatkan lebar layar yang kemudian menjadi dasar dalam menentukan lebar kartu. Sementara itu, pada ItemCard, ScaffoldMessenger.of(context) digunakan untuk mencari pengelola SnackBar terdekat dan Navigator.of(context) digunakan untuk mengakses navigator ketika berpindah halaman. Karena setiap widget memiliki posisi masing-masing dalam widget tree, penggunaan context harus memperhatikan posisi widget terhadap fasilitas yang ingin diakses. BuildContext membantu widget berinteraksi dengan lingkungan dan struktur aplikasi tempat widget tersebut berada.

### 6. Jelaskan konsep *hot reload* di Flutter dan apa perbedaannya dengan *hot restart*! Kapan kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan *hot restart* atau *full restart*?

*Hot reload* merupakan fitur Flutter yang memungkinkan developer melihat perubahan kode secara langsung tanpa harus menjalankan ulang aplikasi dari awal. Ketika hot reload dilakukan, Flutter memasukkan perubahan kode ke Dart VM yang sedang berjalan, kemudian membangun ulang widget tree agar perubahan tersebut dapat ditampilkan. Salah satu kelebihannya adalah state aplikasi tetap dipertahankan, sehingga developer tidak perlu mengulangi aktivitas yang sebelumnya sudah dilakukan. Sementara itu, *hot restart* menjalankan ulang aplikasi dari awal, termasuk menjalankan kembali fungsi main() dan menginisialisasi ulang state aplikasi. Akibatnya, data sementara yang sebelumnya tersimpan dalam state akan kembali ke kondisi awal. Adapun *full restart* dilakukan dengan menghentikan aplikasi sepenuhnya, kemudian menjalankannya kembali melalui proses build dan menjalankan aplikasi dari awal.

Dalam proyek ini, hot reload sudah cukup untuk perubahan yang hanya berkaitan dengan tampilan, seperti mengubah teks, padding, warna SnackBar, atau susunan Row dan Column. Namun, ada beberapa perubahan yang tidak langsung terlihat hanya dengan hot reload. Salah satu contohnya adalah perubahan pada nilai yang hanya diinisialisasi ketika aplikasi pertama kali dijalankan. Pada proyek ini, daftar items serta informasi npm, nama, dan kelas disimpan sebagai static const, sehingga perubahan pada nilai awal tersebut tidak dievaluasi ulang melalui hot reload. Oleh karena itu, ketika mengubah warna tombol, menambahkan tombol baru ke dalam daftar items, atau menambahkan isi entries, hot restart diperlukan agar perubahan dapat diterapkan. Perubahan pada struktur kelas model, seperti menambahkan field color atau entries pada ItemHomepage, juga membutuhkan hot restart karena objek konstanta yang sudah ada masih menggunakan struktur sebelumnya.

Full restart diperlukan ketika aplikasi harus dihentikan dan dijalankan kembali sepenuhnya, misalnya ketika terdapat perubahan yang tidak dapat diterapkan melalui hot reload maupun hot restart. Dalam proyek ini, ketika terjadi kesalahan penulisan nilai warna pada tema, aplikasi gagal dikompilasi sehingga tidak dapat langsung menggunakan hot reload. Setelah kesalahan diperbaiki, aplikasi harus dijalankan kembali menggunakan perintah flutter run -d chrome. Selain itu, saya juga baru mengetahui bahwa menekan tombol refresh (F5) di Chrome tidak secara otomatis mengompilasi ulang kode Dart, melainkan hanya memuat ulang hasil build yang sudah tersedia. Untuk menerapkan perubahan kode, hot reload dapat dilakukan melalui terminal dengan menekan r, sedangkan hot restart dilakukan dengan menekan R.

## Referensi

1. Flutter. (n.d.). [Building user interfaces with Flutter](https://docs.flutter.dev/ui). Flutter Documentation.
2. Flutter. (n.d.). [StatelessWidget class](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html). Flutter API Documentation.
3. Flutter. (n.d.). [Add interactivity to your Flutter app](https://docs.flutter.dev/ui/interactivity). Flutter Documentation.
4. Flutter. (n.d.). [BuildContext class](https://api.flutter.dev/flutter/widgets/BuildContext-class.html). Flutter API Documentation.
5. Flutter. (n.d.). [Hot reload](https://docs.flutter.dev/tools/hot-reload). Flutter Documentation.