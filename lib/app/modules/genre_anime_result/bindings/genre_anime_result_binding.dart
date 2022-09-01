import 'package:get/get.dart';

import '../controllers/genre_anime_result_controller.dart';

class GenreAnimeResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreAnimeResultController>(
      () => GenreAnimeResultController(),
    );
  }
}
