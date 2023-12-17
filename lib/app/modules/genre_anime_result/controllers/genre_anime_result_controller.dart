import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';
import 'package:my_anime_list/app/data/model/genre_model.dart' as gen;

class GenreAnimeResultController extends GetxController {
  Map<String, dynamic> page = {};
  final PagingController<int, Animes> animeByGenre =
      PagingController<int, Animes>(firstPageKey: 1);
  final gen.Genre genre = Get.arguments;
  // ! fungsi untuk fetching anime based genre
  void genreAnime(int g, int p) async {
    try {
      Uri url = Uri.parse(
          'https://api.jikan.moe/v4/anime?genres=$g&page=$p&sort=asc&sfw=false&genres_exclude=12,49,28');
      var response = await http.get(url);
      var tempdata = json.decode(response.body)["data"];
      var data = tempdata.map((e) => Animes.fromJson(e)).toList();
      List<Animes> listAnimeByGenre = List<Animes>.from(data);

      if (listAnimeByGenre.isEmpty) {
        // No data found
        Get.snackbar("Error", "No data found");
      } else {
        final nextPage = json.decode(response.body)["pagination"]['has_next_page'];
        final isLastPage = nextPage == null;

        if (isLastPage) {
          animeByGenre.appendLastPage(listAnimeByGenre);
          // Get.snackbar("Error", "No more data");
        } else {
          animeByGenre.appendPage(listAnimeByGenre, p + 1);
        }
      }
    } catch (e) {
      animeByGenre.error = e;
    }
  }

  @override
  void onInit() {
    animeByGenre.addPageRequestListener((pageKey) {
      genreAnime(genre.malId!, pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    animeByGenre.dispose();
    super.dispose();
  }
}
