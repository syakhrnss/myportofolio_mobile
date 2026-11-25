import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.apiClient, super.key});

  final ApiClient apiClient;

  /// Bagian utama aplikasi untuk mengatur judul dan kombinasi warna tampilan aplikasi.
  @override
  Widget build(BuildContext context) {
    // MultiProvider menyisipkan ApiClient dan AuthState ke seluruh widget tree.
    return MultiProvider(
      providers: [
        Provider.value(value: apiClient),
        ChangeNotifierProvider(create: (_) => AuthState(apiClient)),
      ],
      child: MaterialApp(
        title: 'MyPortfolio',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(
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
      ),
    );
  }
}
