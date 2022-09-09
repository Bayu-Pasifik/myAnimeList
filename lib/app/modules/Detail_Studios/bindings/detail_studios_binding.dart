import 'package:get/get.dart';

import '../controllers/detail_studios_controller.dart';

class DetailStudiosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailStudiosController>(
      () => DetailStudiosController(),
    );
  }
}
