import 'package:get/get.dart';

import '../controllers/detail_manga_controller.dart';

class DetailMangaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMangaController>(
      () => DetailMangaController(),
    );
  }
}
