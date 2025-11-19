import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordankourt_app/app/routes/app_pages.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final loginEmailController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerNameController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final registerPasswordController = TextEditingController();


  final obscureLoginPassword = true.obs;
  final obscureRegisterPassword = true.obs;

  final rememberMe = false.obs;
  final agreeTerms = false.obs;
  final errorMessage = ''.obs;

  void toggleLoginPassword() {
    obscureLoginPassword.value = !obscureLoginPassword.value;
  }

  void toggleRegisterPassword() {
    obscureRegisterPassword.value = !obscureRegisterPassword.value;
  }


  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void toggleAgreeTerms(bool? value) {
    agreeTerms.value = value ?? false;
  }

  void login() {
    // Clear previous error
    errorMessage.value = '';

    // Validate email
    if (loginEmailController.text.isEmpty) {
      errorMessage.value = '*Invalid email or password*';
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(loginEmailController.text)) {
      errorMessage.value = '*Invalid email or password*';
      return;
    }

    // Validate password
    if (loginPasswordController.text.isEmpty) {
      errorMessage.value = '*Invalid email or password*';
      return;
    }

    // Check if terms are agreed
    if (!agreeTerms.value) {
      Get.snackbar(
        'Terms Required',
        'Please agree to our terms to continue',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Implement actual login logic with API
    // For demo, simulate invalid credentials
    if (loginEmailController.text != 'demo@example.com' ||
        loginPasswordController.text != 'password') {
      errorMessage.value = '*Invalid email or password*';
      return;
    }

    // Show subscription popup before navigating to home
    // Get.dialog(SubscriptionPopupWidget(), barrierDismissible: false).then((_) {
    //   // After dialog is dismissed, navigate to home
    //   Get.offAllNamed('/home');
    // });
  }

  void forgotPassword() {
    // TODO: Navigate to forgot password screen
    Get.toNamed(Routes.FORGET_PASSWORD);
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }

  void goBack() {
    // Always navigate to onboarding for back button
    Get.offNamed('/onboarding');
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}
