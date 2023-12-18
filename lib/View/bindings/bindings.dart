import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../controller/HomePageController.dart';
import '../../controller/roomcart-controller.dart';
import '../../controller/theme-controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.put(ThemeController());
    Get.put(CartController());

  }
}