import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt hitung = 1.obs; 

  void increment() {
    if (hitung < 100) {
        hitung++;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh lebih dari 100",
        backgroundColor: Colors.red,
        icon: const Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    }
  }

  void decrement() {
    if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh kurang dari 1",
        backgroundColor: Colors.red,
        icon: const Icon(Icons.warning, color: Colors.white),
        colorText: Colors.white,
      );
    }
  }
}
