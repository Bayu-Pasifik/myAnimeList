import 'package:get/get.dart';

import '../controllers/anime_upcoming_controller.dart';

class AnimeUpcomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeUpcomingController>(
      () => AnimeUpcomingController(),
    );
  }
}
