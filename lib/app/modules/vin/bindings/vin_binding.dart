import 'package:get/get.dart';

import '../controllers/vin_controller.dart';

class VinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VinController>(
      () => VinController(),
    );
  }
}
