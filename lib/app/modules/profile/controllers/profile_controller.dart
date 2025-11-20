import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final RxString userName = ''.obs;
  final RxString email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize user data or fetch from API
    userName.value = 'John Doe';
    email.value = 'john.doe@example.com';
  }

  // Prevent showing the popup multiple times per controller lifecycle
  bool _hasShownSubscriptionPopup = false;

  @override
  void onReady() {
    super.onReady();
    // Show the subscription popup 1 seconds after the Account screen is ready
    if (!_hasShownSubscriptionPopup) {
      _hasShownSubscriptionPopup = true;
      Future.delayed(const Duration(seconds: 1), () {
        // Ensure the controller is still mounted
        if (!isClosed) {
         // Get.dialog(SubscriptionPopupWidget(), barrierDismissible: true);
        }
      });
    }
  }

  void navigateToTryPremium() {
   // Get.toNamed(Routes.TRY_PREMIUM);
  }

  void navigateToEditProfile() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  void navigateToMyDesigns() {
  //  Get.toNamed(Routes.MY_DESIGNS);
  }

  void navigateToChangePassword() {
   // Get.toNamed(Routes.CHANGE_PASSWORD);
  }

  void navigateToRateApp() {
    // Show rate app modal instead of navigating to screen
  //  Get.dialog(const RateAppModal(), barrierDismissible: true);
  }

  void navigateToTermsAndConditions() {
   // Get.toNamed(Routes.TERMS_AND_CONDITIONS);
  }

  void logout() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        title: const Text(
          'Logout',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111111),
          ),
        ),
        content: const Text(
          'Are you sure you want to log out from this app?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Color(0xFF666666),
            fontWeight: FontWeight.w400,
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF0F0F0),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111111),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement actual logout logic (clear tokens, etc.)
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D4D),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }
}
