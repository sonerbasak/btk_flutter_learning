import 'package:flutter/material.dart';
import 'package:navigator_widget/pages/basic_nav.dart';
import 'package:navigator_widget/pages/veri_aktarimi.dart';
import 'package:navigator_widget/routes/app_routes.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Kullanımı'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNavigatorButton(
              "Temel Navigasyon",
              "Pısh ve Pop İşlemleri",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/basic",
                  arguments: {'isim': "Soner", 'yas': 30, 'sehir': "İstanbul"},
                );
              },
            ),
            _buildNavigatorButton(
              "İsimlendirilmiş Rotalar",
              "Named Routes Kullanımı",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.temel_navigation);
              },
            ),
            _buildNavigatorButton(
              "Veri Aktarımı",
              "Sayfalar Arası Veri Aktarımı",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.veri_aktarimi);
              },
            ),
            _buildNavigatorButton(
              "Geri Dönüş Değerleri",
              "Sayfadan veri alma",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.return_w_pop);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigatorButton(
    String title,
    String subtitle, {
    required VoidCallback onPressed,
  }) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onPressed,
      ),
    );
  }
}
