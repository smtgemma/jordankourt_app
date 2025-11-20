import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/constants/app_image.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  // GestureDetector(
                  //   onTap: () => Navigator.of(context).pop(),
                  //   child: Container(
                  //     width: 40,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFE8E8E8),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Center(
                  //       child: SvgPicture.asset(
                  //         'assets/logos/back_arrow.svg',
                  //         width: 20,
                  //         height: 20,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(width: 16),
                  const Text(
                    'Account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // User Info
            Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFD9D9D9),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profilepicture.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Obx(
                      () => Text(
                    controller.userName.value,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Obx(
                      () => Text(
                    controller.email.value,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xFF8F9BB3),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Premium CTA Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GestureDetector(
                onTap: controller.navigateToTryPremium,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF).withOpacity(.14),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          SvgImagePath.premium,
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFC94D),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child:  Text(
                                '3 days of free trial',
                                style:context.textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                             Text(
                              'Go Premium to unlock full creative control of your space.',
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: Colors.white
                              )
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Menu List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _AccountMenuItem(
                    icon: Icons.edit,
                    label: 'Edit Profile',
                    onTap: controller.navigateToEditProfile,
                  ),
                  _AccountMenuItem(
                    icon: Icons.language,
                    label: 'Language',
                    onTap: controller.navigateToMyDesigns,
                  ),
                  _AccountMenuItem(
                    icon: Icons.lock_outline,
                    label: 'Change Password',
                    onTap: controller.navigateToChangePassword,
                  ),
                  _AccountMenuItem(
                    icon: Icons.help_outline,
                    label: 'Terms and condition',
                    onTap: controller.navigateToTermsAndConditions,
                  ),
                  _AccountMenuItem(
                    icon: Icons.support_agent_outlined,
                    label: 'Contact Support',
                    onTap: () {},
                  ),
                  _AccountMenuItem(
                    icon: Icons.delete,
                    label: 'Delete My Data',
                    onTap: controller.navigateToTermsAndConditions,
                  ),
                  // Logout (special style)
                  _AccountMenuItem(
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: controller.logout,
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isLogout;

  const _AccountMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    // final color = isLogout ? const Color(0xFFFF4D4D) : const Color(0xFF111111); // Unused
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF).withOpacity(.14),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isLogout
                    ? const Color(0xFFFF4D4D)
                    : const Color(0xFF97A3AE),
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
