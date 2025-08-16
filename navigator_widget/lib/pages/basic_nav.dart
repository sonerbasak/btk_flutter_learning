import 'package:flutter/material.dart';

class BasicNavigation extends StatelessWidget {
  const BasicNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(title: Text("Temel Navigasyon")),
      body: Center(
        child: Column(
          children: [
            Text(args['isim'] ?? "İsim Yok"),
            Text(args['yas'].toString()),
            Text(args['sehir'] ?? "sehir Yok"),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsNavigation(),
                  ),
                );
              },
              child: const Text("Ayarlar Sayfasına Git"),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsNavigation extends StatelessWidget {
  const SettingsNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Ayarlar Sayfası"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text("Geri Dön"),
            ),
          ],
        ),
      ),
    );
  }
}
