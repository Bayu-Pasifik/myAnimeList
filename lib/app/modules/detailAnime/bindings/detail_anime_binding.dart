import 'package:get/get.dart';

import '../controllers/detail_anime_controller.dart';

class DetailAnimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAnimeController>(
      () => DetailAnimeController(),
    );
  }
}
