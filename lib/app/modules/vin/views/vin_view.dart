import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vin_controller.dart';

class VinView extends GetView<VinController> {
  const VinView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
