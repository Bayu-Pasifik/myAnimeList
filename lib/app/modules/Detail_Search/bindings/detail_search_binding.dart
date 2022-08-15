import 'package:get/get.dart';

import '../controllers/detail_search_controller.dart';

class DetailSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSearchController>(
      () => DetailSearchController(),
    );
  }
}
