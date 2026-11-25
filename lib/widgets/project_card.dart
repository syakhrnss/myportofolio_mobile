import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/screens/section_page.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

/// Kartu tombol aksi. Warna latar diambil dari [ItemHomepage.color].
/// Menekannya memunculkan SnackBar lalu membuka halaman yang sesuai.
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  void _showSnack(ScaffoldMessengerState messenger, String text) {
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: item.color,
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(item.icon, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(text, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      );
  }

  Future<void> _handleLogout(BuildContext context) async {
    final auth = context.read<AuthState>();
    final messenger = ScaffoldMessenger.of(context);
    if (!auth.isLoggedIn) {
      _showSnack(messenger, "Kamu belum login.");
      return;
    }
    await auth.logout();
    _showSnack(messenger, "Kamu berhasil logout.");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          if (item.name == "Logout") {
            await _handleLogout(context);
            return;
          }

          _showSnack(
            ScaffoldMessenger.of(context),
            "Kamu telah menekan tombol ${item.name}!",
          );

          final entries = item.entries;
          if (entries != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SectionPage(
                  title: item.name,
                  icon: item.icon,
                  color: item.color,
                  entries: entries,
                ),
              ),
            );
          } else if (item.name == "Lihat Proyek") {
            // Data proyek diambil dari API Django.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectListScreen(),
              ),
            );
          } else if (item.name == "Tambah Proyek") {
            // Dilindungi: harus login dulu.
            final ok = await ensureLoggedIn(context);
            if (!context.mounted || !ok) return;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
            );
          } else if (item.name == "Tambah Education") {
            // push() agar user bisa kembali dengan tombol Back.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EducationFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
