import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final bioController = TextEditingController();

  // Profile picture
  final Rx<File?> profileImage = Rx<File?>(null);
  final RxString profileImagePath = 'assets/images/profilepicture.jpg'.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Initialize with current user data
    // In a real app, this would come from a user service or API
    nameController.text = 'Marianne Roe';
    phoneController.text = '01688148194';
    locationController.text = 'Dhaka, Kadamtoli, Bangladesh';
    bioController.text = '';
  }

  Future<void> pickProfileImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (image != null) {
        profileImage.value = File(image.path);
        profileImagePath.value = image.path;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveProfile() {
    // Validate inputs
    if (nameController.text.trim().isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Name cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // In a real app, this would save to backend/database
    // For now, we'll just show a success message and go back
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Navigate back to account screen
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    locationController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
