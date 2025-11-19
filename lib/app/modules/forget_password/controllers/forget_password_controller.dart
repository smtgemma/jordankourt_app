import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final forgetEmailController = TextEditingController();
  final forgetNewpassController = TextEditingController();
  final forgetNewConpassController = TextEditingController();

  final obscurePassword = true.obs;
  final obscureConPassword = true.obs;


  void toggleNewPassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPassword() {
    obscureConPassword.value = !obscureConPassword.value;
  }

}
