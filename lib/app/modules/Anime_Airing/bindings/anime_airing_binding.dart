import 'package:get/get.dart';

import '../controllers/anime_airing_controller.dart';

class AnimeAiringBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeAiringController>(
      () => AnimeAiringController(),
    );
  }
}
