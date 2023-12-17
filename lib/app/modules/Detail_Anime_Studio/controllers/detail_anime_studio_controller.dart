import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart';

class DetailAnimeStudioController extends GetxController {
  final PagingController<int, Animes> animeByStudio =
      PagingController<int, Animes>(firstPageKey: 1);
  Studios studios = Get.arguments;
  // ! fungsi untuk anime pada sebuah studio
  void getAnimeStudio(int id, int p) async {
    //! Ambil data dari API
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/anime?producers=$id&page=$p&order_by=title&sort=asc&sfw=false&genres_exclude=12,49,28');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    Map<String, dynamic> data = json.decode(res.body);
    var tempAnime = data['data'].map((e) => Animes.fromJson(e)).toList();
    List<Animes> listAnimeByStudio = List<Animes>.from(tempAnime);
    if (listAnimeByStudio.isEmpty) {
      // No data found
      Get.snackbar("Error", "No data found");
    } else {
      final nextPage = json.decode(res.body)["pagination"]['has_next_page'];
      final isLastPage = nextPage == false;

      if (isLastPage) {
        animeByStudio.appendLastPage(listAnimeByStudio);
      } else {
        animeByStudio.appendPage(listAnimeByStudio, p + 1);
      }
    }
  }

  @override
  void onInit() {
    animeByStudio.addPageRequestListener((pageKey) {
      getAnimeStudio(studios.malId!, pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    animeByStudio.dispose();
    super.dispose();
  }
}
