import 'package:get/get.dart';

import '../controllers/kitab_controller.dart';

class KitabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KitabController>(
      () => KitabController(),
    );
  }
}
