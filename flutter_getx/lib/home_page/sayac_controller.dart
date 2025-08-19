import 'package:get/get_state_manager/get_state_manager.dart';

class SayacController extends GetxController {
  int sayac = 0;
  void arttir() {
    sayac++;
    update();
  }

  void azalt() {
    sayac--;
    update();
  }
}
