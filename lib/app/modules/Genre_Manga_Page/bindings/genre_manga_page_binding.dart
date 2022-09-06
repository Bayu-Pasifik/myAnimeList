import 'package:get/get.dart';

import '../controllers/genre_manga_page_controller.dart';

class GenreMangaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreMangaPageController>(
      () => GenreMangaPageController(),
    );
  }
}
