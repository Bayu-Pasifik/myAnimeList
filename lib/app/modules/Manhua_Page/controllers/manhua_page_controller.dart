import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;

class ManhuaPageController extends GetxController {
  final PagingController<int, manga.Manga> manhuaController =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  Map<String, dynamic> page = {};
  // ! fungsi untuk top anime
  void allManhua(int p) async {
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/manga?type=manhua&page=$p&sfw=false');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempmangaList =
          data["data"].map((e) => manga.Manga.fromJson(e)).toList();
      List<manga.Manga> listManga = List<manga.Manga>.from(tempmangaList);
      page = data["pagination"];
      final isLastPage = page['has_next_page'] == false;
      if (isLastPage) {
        Get.snackbar("Error", "No more data");
        manhuaController.appendLastPage(listManga);
      } else {
        manhuaController.appendPage(listManga, p + 1);
      }
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    manhuaController.addPageRequestListener((pageKey) {
      allManhua(pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    manhuaController.dispose();
    super.dispose();
  }
}
