import 'package:get/get.dart';

import '../controllers/home_manga_controller.dart';

class HomeMangaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeMangaController>(
      () => HomeMangaController(),
    );
  }
}
