import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart';
import 'package:my_anime_list/app/data/model/manga/recomend_model.dart';

class HomeMangaController extends GetxController {
  CarouselController carouselController = CarouselController();
  Rx<int> selectIndex = 0.obs;
  Rx<int> currentSlider = 0.obs;
  Map<String, dynamic> page = {};
  late Future<List?> mangaTop;
  late Future<List?> mangareq;
  List<dynamic> listMangaManga = [];
  List<dynamic> listReqManga = [];
  // ! function change page
  void chagePage(int index) {
    selectIndex.value = index;
    update();
  }

  // ! fungsi untuk top anime
  Future<List?> topManga() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/top/manga');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempMangaList = data["data"].map((e) => Manga.fromJson(e)).toList();
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
      print(tempMangaList[0]);
      listReqManga.addAll(tempMangaList);
      update();
      return listReqManga;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    mangaTop = topManga();
    mangareq = reqManga();
    super.onInit();
  }
}
