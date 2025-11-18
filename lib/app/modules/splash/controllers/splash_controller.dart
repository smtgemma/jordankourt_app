import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("SplashController INIT"); // Debug check

    Future.delayed(const Duration(seconds: 5), () {
      print("Going to home..."); // Debug
      Get.offAllNamed(Routes.ONBOARDING);
    });
  }


}
