import 'package:flutter/widgets.dart';
import 'package:navigator_widget/main.dart';
import 'package:navigator_widget/pages/basic_nav.dart';
import 'package:navigator_widget/pages/veri_aktarimi.dart';

class AppRoutes {
  static const String home = '/';
  static const String temel_navigation = '/basic';
  static const String veri_aktarimi = '/veri_aktarimi';
  static const String return_w_pop = '/return-data';

  static Map<String, Widget Function(BuildContext)> get routes => {
    home: (context) => const MyHomePage(),
    temel_navigation: (context) => BasicNavigation(),
    veri_aktarimi: (context) => Veriktarimi(),
    return_w_pop: (context) => Veriktarimi(),
  };
}
