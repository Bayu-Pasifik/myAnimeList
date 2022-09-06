import 'package:get/get.dart';

import '../controllers/manhwa_page_controller.dart';

class ManhwaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManhwaPageController>(
      () => ManhwaPageController(),
    );
  }
}
