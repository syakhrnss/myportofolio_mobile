import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/utils/validators.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

/// Halaman formulir untuk menambahkan data Education ke portofolio.
///
/// Berupa [StatefulWidget] karena isian formulir akan berubah-ubah
/// selama pengguna mengisi.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Education Form'),
        ),
        // Warna diambil dari tema agar konsisten dengan halaman lain.
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      // Drawer yang sama dengan halaman utama.
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        // SingleChildScrollView membuat formulir bisa digulir di layar sempit.
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Nama Institusi ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Universitas Indonesia",
                    labelText: "Nama Institusi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value!;
                    });
                  },
                  validator: (String? value) => validateRequiredText(
                    value,
                    fieldName: "Nama institusi",
                  ),
                ),
              ),

              // === Jenjang ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenjang",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _level,
                  items: _levels
                      .map((level) => DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _level = newValue!;
                    });
                  },
                ),
              ),

              // === Jurusan ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Sistem Informasi",
                    labelText: "Jurusan / Program Studi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _major = value!;
                    });
                  },
                  validator: (String? value) => validateRequiredText(
                    value,
                    fieldName: "Jurusan",
                  ),
                ),
              ),

              // === Tanggal Mulai ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startController,
                  readOnly: true,
                  onTap: () => _pickDate(isStart: true),
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal mulai",
                    labelText: "Tanggal Mulai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (_) => validateRequiredDate(
                    _startDate,
                    fieldName: "Tanggal mulai",
                  ),
                ),
              ),

              // === Tanggal Selesai ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endController,
                  readOnly: true,
                  onTap: () => _pickDate(isStart: false),
                  decoration: InputDecoration(
                    hintText: "Pilih tanggal selesai",
                    labelText: "Tanggal Selesai",
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (_) => validateEndDate(
                    start: _startDate,
                    end: _endDate,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}