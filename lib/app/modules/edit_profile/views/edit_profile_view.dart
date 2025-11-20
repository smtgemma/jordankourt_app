import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/widget/custom_button.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text(
            'Edit Profile',
            style: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white
            )
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                // Header with dark background
                Container(
                  color: Colors.black,
                  height: 140,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),

                ),
                // Main content area with rounded top corners
                Expanded(
                  child: Container(
                    decoration:  BoxDecoration(
                     // color: Colors.blue,
                      color: Color(0xffFFFFFF).withOpacity(.15),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 80),
                          // Name Field
                          _TextFieldWithLabel(
                            label: 'Name',
                            controller: controller.nameController,
                            hintText: 'Enter your name',
                          ),
                          const SizedBox(height: 24),
                          // Phone Number Field
                          _TextFieldWithLabel(
                            label: 'Phone Number',
                            controller: controller.phoneController,
                            hintText: 'Enter your phone number',
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 24),
                          // Location Field
                          _TextFieldWithLabel(
                            label: 'Location',
                            controller: controller.locationController,
                            hintText: 'Enter your location',
                          ),
                          const SizedBox(height: 24),
                          // Bio Field

                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Profile picture overlay - positioned on top of everything
            Positioned(
              left: 20,
              top: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Obx(
                        () => Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: controller.profileImage.value != null
                              ? FileImage(controller.profileImage.value!)
                              :   NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36')
                          as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 15,
                            spreadRadius: 2,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: controller.pickProfileImage,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E8E8),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 18,
                          color: Color(0xFF111111),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Save Button (sticky at bottom)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GradientButton(
                  onTap: (){},
                  text: 'Save',
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}



class _TextFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int maxLines;

  const _TextFieldWithLabel({
    required this.label,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: context.textTheme.labelLarge!.copyWith(
            color: Colors.white
          ),
        ),
        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF).withOpacity(.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF111111),
              height: 1.5,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8F9BB3),

              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              filled: true,
              fillColor:  Color(0xffFFFFFF).withOpacity(.14),
            ),
          ),
        ),
      ],
    );
  }
}
