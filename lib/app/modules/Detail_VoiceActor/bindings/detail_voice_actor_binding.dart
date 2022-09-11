import 'package:get/get.dart';

import '../controllers/detail_voice_actor_controller.dart';

class DetailVoiceActorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailVoiceActorController>(
      () => DetailVoiceActorController(),
    );
  }
}
