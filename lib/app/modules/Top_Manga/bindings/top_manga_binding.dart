import 'package:get/get.dart';

import '../controllers/top_manga_controller.dart';

class TopMangaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopMangaController>(
      () => TopMangaController(),
    );
  }
}
