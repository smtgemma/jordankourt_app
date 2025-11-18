import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;
  final rememberMe = false.obs;
  final agreeTerms = false.obs;
  final errorMessage = ''.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
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
    if (emailController.text.isEmpty) {
      errorMessage.value = '*Invalid email or password*';
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(emailController.text)) {
      errorMessage.value = '*Invalid email or password*';
      return;
    }

    // Validate password
    if (passwordController.text.isEmpty) {
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
    if (emailController.text != 'demo@example.com' ||
        passwordController.text != 'password') {
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
    Get.toNamed('/forgot-password');
  }

  void navigateToRegister() {
    Get.toNamed('/register');
  }

  void goBack() {
    // Always navigate to onboarding for back button
    Get.offNamed('/onboarding');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
