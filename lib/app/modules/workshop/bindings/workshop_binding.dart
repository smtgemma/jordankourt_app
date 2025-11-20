import 'package:get/get.dart';

import '../controllers/workshop_controller.dart';

class WorkshopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkshopController>(
      () => WorkshopController(),
    );
  }
}
