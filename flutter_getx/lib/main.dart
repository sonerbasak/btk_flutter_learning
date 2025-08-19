import 'package:flutter/material.dart';
import 'package:flutter_getx/home_page/home_binding.dart';
import 'package:flutter_getx/home_page/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  // simple state ---> getstate -> update
  // reactive: no addition
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // put ile widget tree'ye ekleyip find ile bulunur
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: '/home',
          page: () => MyHomePage(),
          binding: HomeBinding(),
        ),
      ],
      initialRoute: '/home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
