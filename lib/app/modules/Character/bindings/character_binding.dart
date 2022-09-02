import 'package:get/get.dart';

import '../controllers/character_controller.dart';

class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(
      () => CharacterController(),
    );
  }
}
