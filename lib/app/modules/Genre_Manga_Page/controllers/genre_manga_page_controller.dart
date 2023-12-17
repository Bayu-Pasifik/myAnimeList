import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import 'package:my_anime_list/app/data/model/genre_model.dart' as gen;

class GenreMangaPageController extends GetxController {
  final gen.Genre genre = Get.arguments;
  Map<String, dynamic> page = {};
  final PagingController<int, manga.Manga> mangaIndexByGenre =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  // ! fungsi untuk fetching genre anime berdasarkan index
  void genreAnime(int g, int p) async {
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/manga?genres=$g&page=$p&order_by=title&sort=asc&sfw=false&genres_exclude=12,49,28');
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
        mangaIndexByGenre.appendLastPage(listManga);
      } else {
        mangaIndexByGenre.appendPage(listManga, p + 1);
      }
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    mangaIndexByGenre.addPageRequestListener((pageKey) {
      genreAnime(genre.malId!, pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    mangaIndexByGenre.dispose();
    super.dispose();
  }
}
