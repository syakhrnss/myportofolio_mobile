import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          project.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.image.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  project.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 120,
                    child: Center(child: Text('Gambar tidak bisa dimuat.')),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              project.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(project.subtitle, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(project.description),
          ],
        ),
      ),
    );
  }
}
