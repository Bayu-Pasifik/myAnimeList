import 'package:get/get.dart';

import '../controllers/manhua_page_controller.dart';

class ManhuaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManhuaPageController>(
      () => ManhuaPageController(),
    );
  }
}
