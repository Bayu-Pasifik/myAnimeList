import 'package:get/get.dart';

import '../controllers/anime_character_controller.dart';

class AnimeCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeCharacterController>(
      () => AnimeCharacterController(),
    );
  }
}
