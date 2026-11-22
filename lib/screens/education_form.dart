import 'package:flutter/material.dart';
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

/// State untuk [EducationFormPage] mengelola formulir.
class _EducationFormPageState extends State<EducationFormPage> {
  /// Kunci untuk mengakses state Form (validate dan reset).
  final _formKey = GlobalKey<FormState>();

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
        // SingleChildScrollView membuat formulir bisa discroll di layar sempit.
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}