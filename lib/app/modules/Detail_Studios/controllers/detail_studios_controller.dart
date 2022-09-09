import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailStudiosController extends GetxController {
  List<dynamic> listAnime = [];
  Map<String, dynamic> pageAnime = {};
  RefreshController animeStudioRefresh =
      RefreshController(initialRefresh: true);
  int halAnime = 1;
  var idStudio = 1.obs;
  // ! fungsi untuk anime pada sebuah studio
  Future<Map<String, dynamic>?> getAnimeStudio(int id, int p) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/anime?producers=$id&page=$p');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    Map<String, dynamic> data = json.decode(res.body);
    var tempAnime = data['data'].map((e) => Animes.fromJson(e)).toList();
    update();
    listAnime.addAll(tempAnime);
    update();
    pageAnime = data['pagination'];
    update();
    return data;
  }

  void refreshStudios() async {
    if (animeStudioRefresh.initialRefresh == true) {
      // ls.clear();
      halAnime = 1;
      update();
      await getAnimeStudio(idStudio.value, halAnime);
      update();
      return animeStudioRefresh.refreshCompleted();
    } else {
      return animeStudioRefresh.refreshFailed();
    }
  }

  void loadStudio() async {
    if (pageAnime["has_next_page"] == true) {
      // debugPrint(pageSeason["has_next_page"].toString());
      halAnime = halAnime + 1;
      update();
      await getAnimeStudio(idStudio.value, halAnime);
      update();
      return animeStudioRefresh.loadComplete();
    } else {
      Get.snackbar("No Data", "There is no more data",
          snackPosition: SnackPosition.BOTTOM);
      // pageSeason.clear();
      return animeStudioRefresh.loadNoData();
    }
  }
}
