import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/core/language/app_translation.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      translations: AppTranslation(),
      locale: const Locale('en', 'US'), // default English
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
