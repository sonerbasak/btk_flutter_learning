import 'package:flutter/material.dart';
import 'package:statefull_example/pages/color_picker_page.dart';
import 'package:statefull_example/theme/app_theme.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: ColorPickerPage(),
    );
  }
}
