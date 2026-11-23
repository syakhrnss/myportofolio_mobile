# Assignment 8: Flutter Navigation, Layouts, Forms, and Input Elements

## Features

### Fitur yang Diimplementasikan

#### 1. Formulir Education

Membuat halaman formulir baru bernama EducationFormPage pada file lib/screens/education_form.dart. Halaman ini menggunakan StatefulWidget, Form, dan GlobalKey<FormState> untuk mengelola input serta proses validasi.

Form menyediakan lima input yang disesuaikan dengan data pendidikan, yaitu:
- Nama Institusi menggunakan TextFormField.
- Jenjang menggunakan DropdownButtonFormField.
- Jurusan menggunakan TextFormField.
- Tanggal Mulai menggunakan showDatePicker().
- Tanggal Selesai menggunakan showDatePicker().

#### 2. Validasi Input

Setiap input dilengkapi validasi untuk memastikan data yang dimasukkan sesuai dengan ketentuan. Kolom wajib tidak boleh kosong atau hanya berisi spasi. Nama institusi dan jurusan juga memiliki batas maksimal 100 karakter. Selain itu, tanggal selesai harus berada setelah atau pada tanggal mulai.

#### 3. Tampilan Formulir

Halaman formulir menggunakan Scaffold dan AppBar dengan warna yang mengikuti tema utama aplikasi melalui colorScheme.primary. Bagian formulir menggunakan SingleChildScrollView agar seluruh input dan tombol Simpan tetap dapat diakses, termasuk ketika ukuran layar terbatas atau papan ketik sedang ditampilkan.

#### 4. Navigasi Formulir

Menambahkan kartu aksi "Tambah Education" pada halaman utama. Ketika kartu ditekan, pengguna diarahkan ke halaman formulir menggunakan Navigator.push(). Selain itu, drawer juga dilengkapi opsi "Add Education". Opsi Home dan Add Project yang sudah tersedia sebelumnya tetap dipertahankan. Widget LeftDrawer digunakan kembali pada halaman utama, formulir proyek, dan formulir Education agar navigasi antarhalaman tetap konsisten.

#### 5. Tombol Simpan dan Dialog Ringkasan

Tombol Simpan menjalankan validasi menggunakan FormState.validate(). Jika seluruh input sudah memenuhi ketentuan, aplikasi akan menampilkan AlertDialog yang berisi ringkasan data pendidikan. Jika masih terdapat input yang tidak valid, pesan kesalahan akan muncul pada kolom terkait dan dialog tidak ditampilkan. Tombol Tutup pada dialog akan menutup dialog sekaligus mengosongkan kembali seluruh input formulir.

### Fitur Tambahan

Selain fitur yang diwajibkan, terdapat beberapa pengembangan tambahan untuk meningkatkan fungsionalitas dan kualitas kode:

- **Switch "Masih berlangsung":** Menambahkan switch untuk menandai pendidikan yang masih dijalani. Ketika diaktifkan, kolom Tanggal Selesai menjadi tidak aktif dan nilainya dikosongkan. Validasi tanggal selesai juga menyesuaikan kondisi tersebut. Pada dialog ringkasan, status pendidikan akan ditampilkan sebagai "Masih berlangsung".
- **Pemisahan fungsi validasi:** Seluruh fungsi validasi ditempatkan dalam file lib/utils/validators.dart agar logika validasi terpisah dari tampilan formulir dan lebih mudah dikelola.
- **Docstring:** Menambahkan dokumentasi singkat pada kelas dan fungsi untuk menjelaskan kegunaannya.
- **Fungsi pembantu _buildDecoration():** Membuat fungsi khusus untuk mengatur dekorasi kolom input sehingga pengaturan tampilannya tidak perlu ditulis berulang kali.
- **Reset formulir:** Seluruh input dikosongkan setelah dialog ringkasan ditutup agar formulir siap digunakan kembali.
- **Menutup keyboard:** Menggunakan keyboardDismissBehavior agar keyboard dapat ditutup dengan menggeser halaman.
- **Penyesuaian warna kartu:** Kartu aksi "Tambah Education" menggunakan warna pink agar sesuai dengan tema aplikasi.

## Project Structure

Berikut struktur file utama yang digunakan dalam pengembangan aplikasi:

| File | Fungsi |
|---|---|
| lib/main.dart | Menjadi titik awal aplikasi dan mengatur tema melalui widget MyApp. |
| lib/screens/menu.dart | Berisi halaman utama MyHomePage, widget InfoCard, serta model ItemHomepage, termasuk kartu aksi Tambah Education. |
| lib/screens/section_page.dart | Menampilkan halaman daftar untuk bagian Project, Experience, dan Education. |
| lib/screens/project_form.dart | Menangani formulir penambahan proyek yang dibuat pada Tutorial 09. |
| lib/screens/education_form.dart | Berisi halaman formulir Education yang dibuat untuk Assignment 8. |
| lib/widgets/left_drawer.dart | Menyediakan menu navigasi Home, Add Project, dan Add Education yang digunakan kembali pada beberapa halaman. |
| lib/widgets/project_card.dart | Berisi widget ItemCard dan pengaturan navigasi ketika kartu ditekan. |
| lib/utils/validators.dart | Menyimpan fungsi-fungsi validasi yang digunakan pada formulir Education. |

## Cara Menjalankan

Pastikan Flutter sudah terpasang dan proyek dibuka melalui direktori utamanya. Jalankan perintah berikut secara berurutan:

```bash
flutter pub get
flutter analyze
flutter run -d chrome
```

## Cara Menguji

1. Jalankan aplikasi melalui Chrome.
2. Buka formulir Education melalui kartu aksi "Tambah Education" pada halaman utama.
3. Coba tekan tombol Simpan ketika salah satu input wajib masih kosong. Pastikan pesan kesalahan muncul pada kolom yang sesuai.
4. Masukkan data pendidikan yang valid, kemudian tekan Simpan dan periksa apakah dialog ringkasan menampilkan data yang telah dimasukkan.
5. Coba aktifkan switch "Masih berlangsung" dan pastikan kolom Tanggal Selesai menjadi tidak aktif serta status tersebut muncul pada dialog ringkasan.
6. Tutup dialog dan pastikan seluruh input formulir kembali kosong.
7. Ulangi pengujian dengan membuka formulir melalui opsi Add Education pada drawer.
8. Gunakan opsi Home pada drawer untuk memastikan pengguna dapat kembali ke halaman utama.

## Pertanyaan Reflektif

### Tugas 8

**1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**

Navigator digunakan untuk mengatur perpindahan halaman dalam aplikasi melalui tumpukan route (*stack*). Navigator.push() digunakan untuk membuka halaman baru tanpa menghapus halaman sebelumnya. Navigator.pushReplacement() digunakan untuk mengganti halaman yang sedang dibuka dengan halaman baru, sehingga halaman sebelumnya tidak lagi berada di tumpukan. Sementara itu, Navigator.pop() digunakan untuk menutup halaman yang sedang aktif dan kembali ke halaman sebelumnya.

Pada aplikasi ini, Navigator.push() digunakan ketika pengguna menekan kartu aksi untuk membuka formulir Education. Dengan begitu, halaman utama tetap tersimpan sehingga pengguna bisa kembali menggunakan tombol Back. Sementara itu, opsi Home pada drawer menggunakan Navigator.pushReplacement() untuk mengganti halaman yang sedang dibuka dengan MyHomePage. Jadi, pengguna bisa langsung kembali ke halaman utama tanpa perlu menekan tombol Back. Metode yang sama juga digunakan pada opsi Add Education agar perpindahan halaman melalui drawer tidak membuat tumpukan halaman semakin panjang.

**2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**

Scaffold berfungsi sebagai kerangka utama untuk menyusun tampilan halaman Flutter. Di dalamnya terdapat AppBar sebagai bagian atas halaman, body untuk menampilkan konten utama, dan drawer sebagai menu navigasi samping. Penggunaan susunan ini pada halaman utama, formulir proyek, dan formulir Education membuat tampilan serta navigasi aplikasi menjadi lebih konsisten.

Drawer dibuat dalam satu widget bernama LeftDrawer yang kemudian digunakan kembali pada setiap halaman. Dengan cara ini, menu navigasi tidak perlu dibuat berulang kali dan perubahan pada drawer cukup dilakukan pada satu file. Salah satu contohnya adalah penggunaan warna utama aplikasi pada AppBar di halaman utama, formulir proyek, dan formulir Education. Ketiganya menggunakan Theme.of(context).colorScheme.primary. Warna yang sama juga diterapkan pada DrawerHeader, sedangkan tombol Simpan menggunakan colorScheme.secondary. Karena warna-warna tersebut sudah diatur dalam ThemeData pada main.dart, tampilannya dapat digunakan secara konsisten di berbagai halaman.

**3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.**

Formulir menggunakan Column karena seluruh input disusun secara vertikal dari atas ke bawah. Di dalam Column terdapat beberapa widget Padding untuk memberikan jarak antarbagian formulir agar tampilannya lebih rapi dan tidak terlalu berdekatan. Selain itu, SizedBox digunakan untuk memberikan ruang tambahan, terutama di bagian bawah tombol Simpan agar tidak terlalu dekat dengan tepi layar.

Formulir juga dibungkus menggunakan SingleChildScrollView karena Column saja tidak menyediakan fitur pengguliran. Jika layar berukuran kecil atau papan ketik sedang ditampilkan, sebagian formulir bisa saja tidak terlihat. Dengan SingleChildScrollView, pengguna tetap dapat menggeser halaman untuk mengakses seluruh input maupun tombol Simpan tanpa mengalami masalah tampilan yang melebihi ukuran layar. Properti keyboardDismissBehavior juga digunakan agar papan ketik dapat ditutup dengan menggeser halaman.

**4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**

GlobalKey<FormState> digunakan untuk mengakses kondisi Form dari bagian kode lain, misalnya ketika ingin menjalankan validasi atau mengosongkan seluruh input. Pada implementasi ini, _formKey dipasang pada widget Form agar fungsi seperti validate() dan reset() dapat dipanggil melalui tombol yang tersedia.

Validator berfungsi untuk memeriksa apakah nilai yang dimasukkan pengguna sudah memenuhi aturan yang ditentukan. Jika input tidak sesuai, validator akan mengembalikan pesan kesalahan yang nantinya ditampilkan pada kolom terkait. Ketika tombol Simpan ditekan, fungsi validate() akan menjalankan seluruh validator yang ada di dalam Form. Jika masih terdapat input yang tidak valid, fungsi tersebut mengembalikan nilai false sehingga dialog ringkasan tidak ditampilkan. Sebaliknya, jika semua input sudah valid, fungsi mengembalikan true dan dialog ringkasan dapat ditampilkan.

Contoh input yang ditolak adalah nama institusi yang hanya berisi spasi, seperti "   ", karena kolom tersebut wajib diisi dengan nama yang sebenarnya. Contoh lainnya adalah tanggal selesai yang lebih awal daripada tanggal mulai. Pemilihan jenis input saja belum cukup untuk memastikan data sudah benar karena TextFormField masih memungkinkan pengguna memasukkan spasi saja, sedangkan showDatePicker() juga memungkinkan pemilihan tanggal yang urutannya tidak sesuai. Oleh karena itu, diperlukan validator untuk memeriksa isi setiap input sekaligus memastikan aturan antarinput sudah terpenuhi.

## AI Disclosure

**Tools yang digunakan:**

ChatGPT (OpenAI), digunakan melalui chat untuk membantu memahami dan mengevaluasi implementasi kode dalam proyek Flutter.

**Strategi prompting:**

Saya menggunakan ChatGPT dengan memberikan instruksi tugas, rubrik penilaian, serta potongan kode yang sedang dikerjakan. Selanjutnya, saya mengajukan pertanyaan mengenai fungsi widget, alur program, dan kemungkinan pengembangan fitur. Saya juga meminta AI untuk memberikan saran perbaikan dan memeriksa apakah implementasi yang sudah dibuat sesuai dengan ketentuan tugas. Penjelasan dan saran yang diberikan digunakan sebagai bahan untuk memahami kode dan mengevaluasi hasil pekerjaan, sedangkan proses implementasi dan perubahan kode tetap saya kerjakan sendiri.

**Bagian yang dibantu AI:**

- Membantu memahami fungsi dan cara kerja widget Flutter yang digunakan dalam formulir, seperti Form, GlobalKey<FormState>
- Memvalidasi ide untuk memisahkan fungsi validasi ke dalam file tersendiri, yaitu lib/utils/validators.dart, agar kode pada education_form.dart lebih terstruktur dan mudah dikelola.
- Membantu mengimplementasikan ide fitur tambahan berupa switch "Masih berlangsung" untuk mengakomodasi pendidikan yang belum selesai, sehingga kolom Tanggal Selesai dapat dinonaktifkan ketika switch diaktifkan.
- Membantu memahami alur validasi formulir, mulai dari penggunaan validator hingga pemanggilan validate() ketika tombol Simpan ditekan.
- Membantu memahami perbedaan Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop() dalam penerapan navigasi aplikasi.
- Membantu mengevaluasi implementasi berdasarkan instruksi dan rubrik tugas

**Keterbatasan AI yang saya temui:**

- Penjelasan AI terkadang masih perlu disesuaikan dengan struktur kode dan kebutuhan aplikasi karena AI tidak selalu mengetahui keseluruhan implementasi proyek.
- Saran yang diberikan tidak selalu langsung sesuai dengan konteks kode yang sedang dikerjakan. Oleh karena itu, saya perlu memberikan potongan kode atau penjelasan tambahan agar saran yang diperoleh lebih relevan.
- Saran mengenai struktur kode dan fitur tambahan tetap perlu dipertimbangkan kembali agar implementasinya tidak menambah kompleksitas yang tidak diperlukan.

**Perbaikan manual yang saya lakukan:**

- Menentukan Education sebagai bagian portofolio yang digunakan untuk formulir baru.
- Mengimplementasikan halaman EducationFormPage beserta lima input yang disesuaikan dengan data pendidikan.
- Membuat dan menyesuaikan validasi untuk isian wajib, batas maksimal karakter, serta urutan tanggal.
- Memisahkan fungsi validasi ke dalam validators.dart.
- Mengimplementasikan fitur switch "Masih berlangsung" beserta penyesuaian kolom Tanggal Selesai dan dialog ringkasan.
- Menambahkan kartu aksi "Tambah Education" dan opsi "Add Education" pada drawer serta menyesuaikan alur navigasinya.
- Menyesuaikan warna dan tampilan formulir agar tetap sesuai dengan tema aplikasi yang sudah dibuat pada tugas sebelumnya.
- Menguji formulir melalui Chrome, termasuk pengujian input tidak valid, input valid, dialog ringkasan, serta navigasi melalui kartu aksi dan drawer.
- Memeriksa kembali implementasi dan melakukan penyesuaian agar seluruh fitur dapat berjalan sesuai dengan instruksi tugas.

**Log prompting:**

**001 / 6 - Memahami fungsi widget formulir Flutter:** [Link](https://chatgpt.com/share/6b03b7e1-4ad0-83ec-8770-83d980124202) Membantu saya memahami fungsi dan cara kerja widget Flutter yang digunakan dalam formulir, seperti Form dan GlobalKey<FormState>.

**002 / 6 - Memvalidasi pemisahan fungsi validasi:** [Link](https://chatgpt.com/share/6b03b7e1-4ad0-83ec-8770-83d980124202) Membantu memvalidasi ide untuk memisahkan fungsi validasi ke dalam file tersendiri, yaitu lib/utils/validators.dart, agar kode pada education_form.dart lebih terstruktur dan mudah dikelola.

**003 / 6 - Mengimplementasikan switch "Masih berlangsung":** [Link](https://chatgpt.com/share/6b03b7e1-4ad0-83ec-8770-83d980124202) Membantu mengimplementasikan ide fitur tambahan berupa switch "Masih berlangsung" untuk mengakomodasi pendidikan yang belum selesai, sehingga kolom Tanggal Selesai dapat dinonaktifkan ketika switch diaktifkan.

**004 / 6 - Memahami alur validasi formulir:** [Link](https://chatgpt.com/share/6b03b7e1-4ad0-83ec-8770-83d980124202) Membantu saya memahami alur validasi formulir, mulai dari penggunaan validator hingga pemanggilan validate() ketika tombol Simpan ditekan.

**005 / 6 - Memahami perbedaan fungsi navigasi:** [Link](https://chatgpt.com/share/6b03b7e1-4ad0-83ec-8770-83d980124202) Membantu saya memahami perbedaan Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop() dalam penerapan navigasi aplikasi.

**006 / 6 - Mengevaluasi implementasi berdasarkan rubrik:** [Link](https://chatgpt.com/share/6b03b7e1-4ad0-83ec-8770-83d980124202) Membantu mengevaluasi implementasi berdasarkan instruksi dan rubrik tugas.

## Referensi

1. Flutter. (n.d.). [Navigator class](https://api.flutter.dev/flutter/widgets/Navigator-class.html). Flutter API Documentation.
2. Flutter. (n.d.). [Form class](https://api.flutter.dev/flutter/widgets/Form-class.html). Flutter API Documentation.
3. Flutter. (n.d.). [Build a form with validation](https://docs.flutter.dev/cookbook/forms/validation). Flutter Documentation.
4. Flutter. (n.d.). [showDatePicker function](https://api.flutter.dev/flutter/material/showDatePicker.html). Flutter API Documentation.
5. Flutter. (n.d.). [Add a drawer to a screen](https://docs.flutter.dev/cookbook/design/drawer). Flutter Documentation.