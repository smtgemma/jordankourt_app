import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/guide_controller.dart';

class GuideView extends GetView<GuideController> {
  const GuideView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GuideView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GuideView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
