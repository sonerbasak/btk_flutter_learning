import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lists_and_pull_data/dio_kullanimi.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),

      home: Scaffold(
        appBar: AppBar(title: const Text('Liste ve Veri İşlemleri')),
        body: DioKullanimi(),
      ),
    );
  }
}
