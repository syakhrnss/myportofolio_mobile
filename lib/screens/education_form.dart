import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/utils/validators.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

/// Halaman formulir untuk menambahkan data Education ke portofolio.
///
/// Berupa [StatefulWidget] karena isian formulir (teks, dropdown, tanggal,
/// switch) berubah-ubah selama pengguna mengisi. Aturan validasi ada di
/// lib/utils/validators.dart, sedangkan file ini hanya mengurus tampilan
/// dan juga alur formulir.
class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

/// State untuk [EducationFormPage]: menyimpan isian dan mengelola formulir.
class _EducationFormPageState extends State<EducationFormPage> {
  /// Kunci untuk mengakses state `Form` (validate dan reset).
  final _formKey = GlobalKey<FormState>();

  /// Controller agar teks tanggal bisa diisi dari `showDatePicker()`.
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  String _institution = "";
  String _level = "S1"; // default
  String _major = "";
  DateTime? _startDate;
  DateTime? _endDate;

  /// True jika pendidikan masih berlangsung (tanggal selesai dinonaktifkan).
  bool _isOngoing = false;

  /// Pilihan jenjang pendidikan pada dropdown.
  final List<String> _levels = ['SMA/SMK', 'D3', 'S1', 'S2', 'S3', 'Lainnya'];

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  /// Mengubah [date] menjadi teks dengan format dd/mm/yyyy.
  String _formatDate(DateTime date) {
    final dd = date.day.toString().padLeft(2, '0');
    final mm = date.month.toString().padLeft(2, '0');
    return '$dd/$mm/${date.year}';
  }

  /// Membuat tampilan kolom isian yang seragam untuk semua input.
  InputDecoration _buildDecoration({
    required String label,
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }

  /// Membuka kalender lalu menyimpan tanggal yang dipilih.
  ///
  /// [isStart] bernilai true untuk tanggal mulai, false untuk tanggal selesai.
  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: (isStart ? _startDate : _endDate) ?? now,
      firstDate: DateTime(1990),
      lastDate: DateTime(now.year + 10),
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _startDate = picked;
        _startController.text = _formatDate(picked);
      } else {
        _endDate = picked;
        _endController.text = _formatDate(picked);
      }
    });
  }

  /// Mengubah status "Masih berlangsung".
  ///
  /// Saat diaktifkan, tanggal selesai dikosongkan karena tidak diperlukan.
  void _toggleOngoing(bool value) {
    setState(() {
      _isOngoing = value;
      if (value) {
        _endDate = null;
        _endController.clear();
      }
    });
  }

  /// Mengosongkan semua isian setelah dialog ditutup.
  void _resetForm() {
    _formKey.currentState!.reset();
    setState(() {
      _institution = "";
      _level = "S1";
      _major = "";
      _startDate = null;
      _endDate = null;
      _isOngoing = false;
      _startController.clear();
      _endController.clear();
    });
  }

  /// Menampilkan ringkasan isian dalam dialog.
  ///
  /// Hanya dipanggil setelah semua input lolos validasi.
  void _showSummary() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Education berhasil ditambahkan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Institusi: $_institution'),
                Text('Jenjang: $_level'),
                Text('Jurusan: $_major'),
                Text('Tanggal Mulai: ${_formatDate(_startDate!)}'),
                Text(
                  'Tanggal Selesai: '
                  '${_isOngoing ? "Masih berlangsung" : _formatDate(_endDate!)}',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.pop(context);
                _resetForm();
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
        title: const Center(child: Text('Add Education Form')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      // SingleChildScrollView membuat formulir bisa discroll di layar sempit
      // atau saat keyboard tampil, sehingga tombol Simpan tetap terjangkau.
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Nama Institusi ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: _buildDecoration(
                    label: "Nama Institusi",
                    hint: "Contoh: Universitas Indonesia",
                  ),
                  onChanged: (value) {
                    _institution = value;
                  },
                  validator: (String? value) =>
                      validateRequiredText(value, fieldName: "Nama institusi"),
                ),
              ),

              // === Jenjang ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: _buildDecoration(label: "Jenjang", hint: ""),
                  initialValue: _level,
                  items: _levels
                      .map(
                        (level) =>
                            DropdownMenuItem(value: level, child: Text(level)),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    _level = newValue ?? _level;
                  },
                ),
              ),

              // === Jurusan ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: _buildDecoration(
                    label: "Jurusan / Program Studi",
                    hint: "Contoh: Sistem Informasi",
                  ),
                  onChanged: (value) {
                    _major = value;
                  },
                  validator: (String? value) =>
                      validateRequiredText(value, fieldName: "Jurusan"),
                ),
              ),

              // === Tanggal Mulai ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startController,
                  readOnly: true,
                  onTap: () => _pickDate(isStart: true),
                  decoration: _buildDecoration(
                    label: "Tanggal Mulai",
                    hint: "Pilih tanggal mulai",
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  validator: (_) => validateRequiredDate(
                    _startDate,
                    fieldName: "Tanggal mulai",
                  ),
                ),
              ),

              // === Switch Masih Berlangsung ===
              SwitchListTile(
                title: const Text('Masih berlangsung'),
                subtitle: const Text('Aktifkan jika belum lulus'),
                value: _isOngoing,
                onChanged: _toggleOngoing,
              ),

              // === Tanggal Selesai ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endController,
                  readOnly: true,
                  enabled: !_isOngoing,
                  onTap: () => _pickDate(isStart: false),
                  decoration: _buildDecoration(
                    label: "Tanggal Selesai",
                    hint: _isOngoing
                        ? "Tidak diperlukan"
                        : "Pilih tanggal selesai",
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  validator: (_) => validateEndDate(
                    start: _startDate,
                    end: _endDate,
                    isOngoing: _isOngoing,
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showSummary();
                      }
                    },
                    child: const Text(
                      "Simpan",
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
