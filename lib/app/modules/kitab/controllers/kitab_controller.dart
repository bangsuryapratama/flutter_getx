import 'package:aplikasi_saya/app/data/models/alquran.dart';
import 'package:aplikasi_saya/app/service/alquran_service.dart';
import 'package:get/get.dart';

class KitabController extends GetxController {

  final AlquranService _alquranService = Get.put<AlquranService>(AlquranService());

  RxList alquran = <AlquranData>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlquran();
  }

    void fetchAlquran() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await _alquranService.fetchAlquran();
      if (response.statusCode == 200) {
        var data = response.body!
            .map((quranJson) => AlquranData.fromJson(quranJson))
            .toList();
        alquran.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }


}
