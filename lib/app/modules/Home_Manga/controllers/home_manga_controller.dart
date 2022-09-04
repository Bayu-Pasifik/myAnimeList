import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import 'package:my_anime_list/app/data/model/manga/recomend_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// import '../../../data/model/manga/manga_model.dart';

class HomeMangaController extends GetxController {
  late TextEditingController searchController;
  CarouselController carouselController = CarouselController();
  Rx<int> selectIndex = 0.obs;
  Rx<int> currentSlider = 0.obs;
  int hal = 1;
  Map<String, dynamic> page = {};
  Map<String, dynamic> pageSearch = {};
  late Future<List?> mangaTop;
  late Future<List?> mangareq;
  List<dynamic> listMangaManga = [];
  List<dynamic> listReqManga = [];
  List<dynamic> resultManga = [];
  RefreshController refreshControllerSearch =
      RefreshController(initialRefresh: true);
  // ! function change page
  void chagePage(int index) {
    selectIndex.value = index;
    update();
  }

  // ! fungsi untuk top manga
  Future<List?> topManga() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/top/manga');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempMangaList =
          data["data"].map((e) => manga.Manga.fromJson(e)).toList();
      page = data["pagination"];
      listMangaManga.addAll(tempMangaList);
      update();
      return listMangaManga;
    } else {
      return null;
    }
  }

  // ! fungsi untuk recommend manga
  Future<List?> reqManga() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/recommendations/manga');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempMangaList =
          data["data"].map((e) => RecomendManga.fromJson(e)).toList();
      page = data["pagination"];
      // print(tempMangaList[0]);
      listReqManga.addAll(tempMangaList);
      update();
      return listReqManga;
    } else {
      return null;
    }
  }

  // ! fungsi untuk mencari anime berdasarkan nama
  Future<Map<String, dynamic>?> searchManga(String keyword, int p) async {
    Uri link = Uri.parse(
        'https://api.jikan.moe/v4/manga?q=$keyword&page=$p&sfw=false');
    var hasil = await http.get(link);
    //! Masukkan data ke dalam variable
    Map<String, dynamic>? data = (json.decode(hasil.body));
    if (data == null) {
      return null;
    }
    var tempData = data["data"].map((e) => manga.Manga?.fromJson(e)).toList();
    resultManga.addAll(tempData);
    // debugPrint(resultManga.toString());
    pageSearch = data["pagination"];
    update();
    return data;
  }

  void refreshSearch(String key) async {
    if (refreshControllerSearch.initialRefresh == true) {
      hal = 1;
      await searchManga(key, hal);
      update();
      return refreshControllerSearch.refreshCompleted();
    } else {
      return refreshControllerSearch.refreshFailed();
    }
  }

  void loadSearch(String key) async {
    if (pageSearch["has_next_page"] == true) {
      hal = hal + 1;
      searchManga(key, hal);
      debugPrint(hal.toString());
      update();
      return refreshControllerSearch.loadComplete();
    } else {
      Get.snackbar("No Data", "There is No More Data",
          snackPosition: SnackPosition.BOTTOM);
      return refreshControllerSearch.loadNoData();
    }
  }

  @override
  void onInit() {
    mangaTop = topManga();
    mangareq = reqManga();
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
