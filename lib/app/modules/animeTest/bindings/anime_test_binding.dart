import 'package:get/get.dart';

import '../controllers/anime_test_controller.dart';

class AnimeTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeTestController>(
      () => AnimeTestController(),
    );
  }
}
