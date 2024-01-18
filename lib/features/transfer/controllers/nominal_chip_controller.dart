import 'package:get/get.dart';

class NominalChipController extends GetxController {
  var selectedIndex = 0.obs;

  void changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
