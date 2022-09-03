import 'package:get/get.dart';

import '../controllers/manga_character_controller.dart';

class MangaCharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MangaCharacterController>(
      () => MangaCharacterController(),
    );
  }
}
