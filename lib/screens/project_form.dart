import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/utils/validators.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

/// Formulir tambah proyek. Kolom mengikuti ProjectSerializer di Django
/// title, subtitle, description, image (opsional).
/// Data dikirim ke API dengan token (harus login dulu).
class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  InputDecoration _buildDecoration({
    required String label,
    required String hint,
  }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _titleController.clear();
    _subtitleController.clear();
    _descriptionController.clear();
    _imageController.clear();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // Route guard: belum login -> diarahkan ke LoginScreen.
    final loggedIn = await ensureLoggedIn(context);
    if (!mounted || !loggedIn) return;

    final auth = context.read<AuthState>();
    final api = context.read<ApiClient>();
    final token = auth.token;
    if (token == null) return;

    final newProject = Project(
      title: _titleController.text.trim(),
      subtitle: _subtitleController.text.trim(),
      description: _descriptionController.text.trim(),
      image: _imageController.text.trim(),
    );

    setState(() {
      _isSubmitting = true;
    });
    try {
      final created = await api.createProject(newProject, token: token);
      if (!mounted) return;
      _showSuccessDialog(created);
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 401) {
        // Token tidak valid: logout lalu minta login ulang.
        await auth.logout();
        if (!mounted) return;
        _showMessage('Sesi login tidak valid. Silakan login ulang.');
        await ensureLoggedIn(context);
      } else if (e.statusCode == 403) {
        _showMessage('Akun ini tidak punya izin menambah proyek (kode 403).');
      } else {
        _showMessage('Gagal menyimpan proyek (kode ${e.statusCode}).');
      }
    } on Exception {
      if (!mounted) return;
      _showMessage('Tidak bisa terhubung ke server. Pastikan Django berjalan.');
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _showSuccessDialog(Project project) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Proyek berhasil ditambahkan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Judul: ${project.title}'),
                Text('Subjudul: ${project.subtitle}'),
                Text('Deskripsi: ${project.description}'),
                if (project.image.isNotEmpty) Text('Gambar: ${project.image}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                _clearForm();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Project Form')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Title ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _titleController,
                  decoration: _buildDecoration(
                    label: "Judul Proyek",
                    hint: "Judul Proyek",
                  ),
                  validator: (value) => validateRequiredText(
                    value,
                    fieldName: "Judul proyek",
                    maxLength: 255,
                  ),
                ),
              ),

              // === Subtitle ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _subtitleController,
                  decoration: _buildDecoration(
                    label: "Subjudul Proyek",
                    hint: "Ringkasan singkat proyek",
                  ),
                  validator: (value) => validateRequiredText(
                    value,
                    fieldName: "Subjudul",
                    maxLength: 255,
                  ),
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: _buildDecoration(
                    label: "Deskripsi Proyek",
                    hint: "Deskripsi Proyek",
                  ),
                  validator: (value) => validateRequiredText(
                    value,
                    fieldName: "Deskripsi proyek",
                    maxLength: 1000,
                  ),
                ),
              ),

              // === Image URL (opsional) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _imageController,
                  keyboardType: TextInputType.url,
                  decoration: _buildDecoration(
                    label: "URL Gambar Proyek (opsional)",
                    hint: "https://.../gambar.png",
                  ),
                  validator: (value) => validateUrl(
                    value,
                    fieldName: "URL gambar",
                    required: false,
                  ),
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
