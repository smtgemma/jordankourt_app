import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordankourt_app/app/core/constants/app_image.dart';
import 'package:jordankourt_app/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      image: ImagePath.onboard1,
      title: 'AI Mechanic Assistant',
      description:
      'Get instant answers to your car questions with our intelligent AI assistant. Available 24/7 to help diagnose issues and provide expert advice.',
    ),
    OnboardingData(
      image: ImagePath.onboard2,
      title: '',
      description:
      'Access comprehensive repair guides, maintenance tips, and technical documentation for all makes and models.',
    ),
    OnboardingData(
      image:ImagePath.onboard3,
      title: 'Parts Marketplace',
      description:
      'Find and compare genuine and aftermarket parts from trusted suppliers. Get the best prices delivered to your door.',
    ),
    OnboardingData(
      image: ImagePath.onboard4,
      title: 'Nearby & Featured Workshops',
      description:
      'Discover certified mechanics and top-rated workshops in your area. Read reviews and book appointments instantly.',
    ),
    OnboardingData(
      image: ImagePath.onboard5,
      title: 'VIN Lookup',
      description:
      'Decode any Vehicle Identification Number to get detailed vehicle history, specifications, and maintenance records.',
    ),
  ];

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void completeOnboarding() {
    // Navigate to home or main screen
     Get.offAllNamed(Routes.LOGIN);
    print('Onboarding completed!');
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}
