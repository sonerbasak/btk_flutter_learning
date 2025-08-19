import 'package:flutter_getx/home_page/sayac_controller.dart';
import 'package:flutter_getx/home_page/sayi_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(SayiController());
    Get.lazyPut(() => SayiController());
    Get.put(SayacController());
  }
}
