import 'package:get/get.dart';

import '../controllers/detail_anime_studio_controller.dart';

class DetailAnimeStudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAnimeStudioController>(
      () => DetailAnimeStudioController(),
    );
  }
}
