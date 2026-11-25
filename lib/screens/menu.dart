import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/section_page.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';

/// Halaman utama aplikasi MyPortfolio Mobile.
///
/// Menampilkan identitas pemilik portofolio lewat tiga [InfoCard] dan
/// menu aksi portofolio lewat sekumpulan [ItemCard] dalam bentuk grid.
/// Berupa [StatelessWidget] karena seluruh datanya statis.
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const String npm = "2506544076";
  static const String nama = "Arsya Khairunissa Budiman";
  static const String kelas = "PBP E";

  /// Daftar menu aksi. Warna disimpan di model sehingga [ItemCard]
  /// tidak perlu logika pewarnaan sendiri.
  static const List<ItemHomepage> items = [
    ItemHomepage("Lihat Proyek", Icons.folder, Colors.blue),
    ItemHomepage("Tambah Proyek", Icons.add_circle, Colors.green),
    ItemHomepage(
      "Lihat Experience",
      Icons.work,
      Colors.orange,
      entries: [
        PortfolioEntry(
          "Staff of Data Science Academy",
          "Invited and coordinated with mentors and guest speakers to support the execution of bootcamp sessions.",
        ),
      ],
    ),
    ItemHomepage(
      "Lihat Education",
      Icons.school,
      Colors.purple,
      entries: [PortfolioEntry("Universitas Indonesia", "Sistem Informasi")],
    ),
    // Kartu aksi untuk membuka formulir Education (Tugas 8).
    ItemHomepage("Tambah Education", Icons.post_add, Color(0xFFF06292)),
    ItemHomepage("Logout", Icons.logout, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur visual dasar halaman (AppBar, Body, SnackBar).
    return Scaffold(
      // AppBar menampilkan bar bagian atas halaman aplikasi.
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      // Body halaman utama dengan padding di sekelilingnya.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Baris horizontal untuk menampilkan 3 InfoCard secara sejajar.
              const IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Name', content: nama),
                    InfoCard(title: 'Class', content: kelas),
                  ],
                ),
              ),

              const SizedBox(height: 16.0),

              // Bagian tengah: pesan sambutan dan kisi tombol menu portofolio.
              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Selamat datang di MyPortfolio Mobile!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    // GridView menampilkan kartu tombol dalam tata letak kisi 3 kolom.
                    GridView.count(
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      // shrinkWrap agar ukuran kisi menyesuaikan tinggi konten anak.
                      shrinkWrap: true,
                      // Scroll dimatikan karena sudah ditangani SingleChildScrollView.
                      physics: const NeverScrollableScrollPhysics(),
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
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

/// Kartu informasi yang menampilkan judul ([title]) dan isi ([content]).
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Memberikan efek bayangan kartu elevasi 2 unit.
      elevation: 2.0,
      child: Container(
        // Menyesuaikan lebar kartu dengan proporsi layar (dibagi 3.5).
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        // Menyusun teks title dan content secara vertikal.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(content, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

/// Model data satu tombol menu yaitu nama, ikon, dan warna latarnya.
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final List<PortfolioEntry>? entries;

  const ItemHomepage(this.name, this.icon, this.color, {this.entries});
}
