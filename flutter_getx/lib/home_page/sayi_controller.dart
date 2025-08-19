import 'dart:math';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SayiController extends GetxController {
  RxInt randomSayi = 0.obs;

  void uret() {
    randomSayi.value = Random().nextInt(100);
  }
}
