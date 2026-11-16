import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Bagian utama aplikasi untuk mengatur judul dan kombinasi warna tampilan aplikasi.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ).copyWith(
          primary: const Color(0xFFFFAFB9),
          secondary: Colors.pink[400],
          tertiary: Colors.blue[600],
        ),
        scaffoldBackgroundColor: const Color(0xFF05014A),
        cardTheme: const CardThemeData(color: Color(0xFF1A1470)),        
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

