import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/workshop_controller.dart';

class WorkshopView extends GetView<WorkshopController> {
  const WorkshopView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkshopView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WorkshopView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
