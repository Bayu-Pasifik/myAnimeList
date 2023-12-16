import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';

class TopAnimeController extends GetxController {
  final PagingController<int, Animes> topAnimeController =
      PagingController<int, Animes>(firstPageKey: 1);
  Map<String, dynamic> page = {};

  Rx<int> hal = 1.obs;
  // ! fungsi untuk top anime
  void topAnime(int p) async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/top/anime?page=$p&sfw=false');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempanimeList =
          data["data"].map((e) => Animes.fromJson(e)).toList();
      List<Animes> listanime = List<Animes>.from(tempanimeList);
      page = data["pagination"];
      final isLastPage = page['has_next_page'] == false;
      if (isLastPage) {
        Get.snackbar("Error", "No more data");
        topAnimeController.appendLastPage(listanime);
      } else {
        topAnimeController.appendPage(listanime, p + 1);
      }
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    topAnimeController.addPageRequestListener((pageKey) {
      topAnime(pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    topAnimeController.dispose();
    super.dispose();
  }
}
