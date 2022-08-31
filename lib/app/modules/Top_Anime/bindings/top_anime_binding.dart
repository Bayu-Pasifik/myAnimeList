import 'package:get/get.dart';

import '../controllers/top_anime_controller.dart';

class TopAnimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopAnimeController>(
      () => TopAnimeController(),
    );
  }
}
