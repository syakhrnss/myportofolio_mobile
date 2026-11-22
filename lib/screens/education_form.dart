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

  String _institution = "";
  String _level = "S1"; // default
  String _major = "";

  /// Pilihan jenjang pendidikan pada dropdown.
  final List<String> _levels = ['SMA/SMK', 'D3', 'S1', 'S2', 'S3', 'Lainnya'];

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
            ],
          ),
        ),
      ),
    );
  }
}