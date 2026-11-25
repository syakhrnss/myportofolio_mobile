import 'package:material_ui/material_ui.dart';

/// Satu baris konten pada [SectionPage] misalnya satu proyek atau satu experience.
class PortfolioEntry {
  final String title;
  final String subtitle;

  const PortfolioEntry(this.title, this.subtitle);
}

/// Halaman daftar sederhana untuk satu bagian portofolio (proyek, experience,
/// education). Warna dan ikon diambil dari kartu menu yang membukanya.
class SectionPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<PortfolioEntry> entries;

  const SectionPage({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: color,
        // Membuat judul dan panah kembali otomatis berwarna putih.
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: entries.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8.0),
        itemBuilder: (context, index) {
          final entry = entries[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: color,
                child: Icon(icon, color: Colors.white),
              ),
              title: Text(
                entry.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(entry.subtitle),
            ),
          );
        },
      ),
    );
  }
}
