import 'package:aplikasi_saya/app/modules/kitab/views/kitab_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/kitab_controller.dart';


class KitabView extends GetView<KitabController> {
   KitabView({Key? key}) : super(key: key);
  final KitabController controller = Get.put(KitabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Al-Quran'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchAlquran,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final alquran = controller.alquran;
        if (alquran.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: alquran.length,
          itemBuilder: (ctx, i) {
            final item = alquran[i];
            return GestureDetector(
              onTap: () => Get.to(() => KitabDetailView(item: item)),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // info surah
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${item.nomor ?? '-'} • ${item.nama ?? ''}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${item.arti ?? ''} • ${item.ayat} ayat",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            item.type.toString().split('.').last,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      // nama arab
                      Text(
                        item.asma ?? '',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
