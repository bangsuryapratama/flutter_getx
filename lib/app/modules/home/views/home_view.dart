import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'HomeView is Working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.toNamed('/counter'),
              child: const Text('Go to Counter'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Get.toNamed('/form-pendaftaran'),
              child: const Text('Go to Form Pendaftaran'),
            ),
          ],
        ),
      ),
    );
  }
}
