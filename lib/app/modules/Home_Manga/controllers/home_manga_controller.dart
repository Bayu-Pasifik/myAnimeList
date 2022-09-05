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

  // ! variable untuk index manga
  RefreshController refreshControllerA =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerB =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerC =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerD =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerE =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerF =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerG =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerH =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerI =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerJ =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerK =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerL =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerM =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerN =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerO =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerP =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerQ =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerR =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerS =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerT =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerU =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerV =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerW =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerX =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerY =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerZ =
      RefreshController(initialRefresh: true);
  // !  variable untuk page index manga
  int currentPage = 1;

  // ! List untuk index manga
  List<dynamic> mangaIndexA = [].obs;
  List<dynamic> mangaIndexB = [].obs;
  List<dynamic> mangaIndexC = [].obs;
  List<dynamic> mangaIndexD = [].obs;
  List<dynamic> mangaIndexE = [].obs;
  List<dynamic> mangaIndexF = [].obs;
  List<dynamic> mangaIndexG = [].obs;
  List<dynamic> mangaIndexH = [].obs;
  List<dynamic> mangaIndexI = [].obs;
  List<dynamic> mangaIndexJ = [].obs;
  List<dynamic> mangaIndexK = [].obs;
  List<dynamic> mangaIndexL = [].obs;
  List<dynamic> mangaIndexM = [].obs;
  List<dynamic> mangaIndexN = [].obs;
  List<dynamic> mangaIndexO = [].obs;
  List<dynamic> mangaIndexP = [].obs;
  List<dynamic> mangaIndexQ = [].obs;
  List<dynamic> mangaIndexR = [].obs;
  List<dynamic> mangaIndexS = [].obs;
  List<dynamic> mangaIndexT = [].obs;
  List<dynamic> mangaIndexU = [].obs;
  List<dynamic> mangaIndexV = [].obs;
  List<dynamic> mangaIndexW = [].obs;
  List<dynamic> mangaIndexX = [].obs;
  List<dynamic> mangaIndexY = [].obs;
  List<dynamic> mangaIndexZ = [].obs;

// ! function untuk index manga
  Future<Map<String, dynamic>?> indexManga(String letter, int hal) async {
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/manga?letter=$letter&page=$hal&order_by=title&sort=asc&sfw=false&genres_exclude=12');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempmangaList =
          data["data"].map((e) => manga.Manga.fromJson(e)).toList();
      if (letter == "A") {
        mangaIndexA.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "B") {
        mangaIndexB.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "C") {
        mangaIndexC.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "D") {
        mangaIndexD.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "E") {
        mangaIndexE.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "F") {
        mangaIndexF.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "G") {
        mangaIndexG.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "H") {
        mangaIndexH.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "I") {
        mangaIndexI.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "J") {
        mangaIndexJ.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "K") {
        mangaIndexK.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "L") {
        mangaIndexL.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "M") {
        mangaIndexM.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "N") {
        mangaIndexN.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "O") {
        mangaIndexO.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "P") {
        mangaIndexP.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "Q") {
        mangaIndexQ.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "R") {
        mangaIndexR.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "S") {
        mangaIndexS.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "T") {
        mangaIndexT.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "U") {
        mangaIndexU.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "V") {
        mangaIndexV.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "W") {
        mangaIndexW.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "X") {
        mangaIndexX.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "Y") {
        mangaIndexY.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "Z") {
        mangaIndexZ.addAll(tempmangaList);
        update();
        page = data["pagination"];
        return data;
      }
    }
    return null;
  }

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

  // ! fungsi untuk mencari manga berdasarkan nama
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
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5));
      return refreshControllerSearch.loadNoData();
    }
  }

  // ! fungsi load data index
  void loadData(String h) async {
    if (h == "A") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerA.loadComplete();
      } else {
        return refreshControllerA.loadNoData();
      }
    } else if (h == "B") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerB.loadComplete();
      } else {
        return refreshControllerB.loadNoData();
      }
    } else if (h == "C") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerC.loadComplete();
      } else {
        return refreshControllerC.loadNoData();
      }
    } else if (h == "D") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerD.loadComplete();
      } else {
        return refreshControllerD.loadNoData();
      }
    } else if (h == "E") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerE.loadComplete();
      } else {
        return refreshControllerE.loadNoData();
      }
    } else if (h == "F") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerF.loadComplete();
      } else {
        return refreshControllerF.loadNoData();
      }
    } else if (h == "G") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerG.loadComplete();
      } else {
        return refreshControllerG.loadNoData();
      }
    } else if (h == "H") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerH.loadComplete();
      } else {
        return refreshControllerH.loadNoData();
      }
    } else if (h == "I") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerI.loadComplete();
      } else {
        return refreshControllerI.loadNoData();
      }
    } else if (h == "J") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerJ.loadComplete();
      } else {
        return refreshControllerJ.loadNoData();
      }
    } else if (h == "K") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerK.loadComplete();
      } else {
        return refreshControllerK.loadNoData();
      }
    } else if (h == "L") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerK.loadComplete();
      } else {
        return refreshControllerK.loadNoData();
      }
    } else if (h == "L") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerK.loadComplete();
      } else {
        return refreshControllerK.loadNoData();
      }
    } else if (h == "M") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerM.loadComplete();
      } else {
        return refreshControllerM.loadNoData();
      }
    } else if (h == "N") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerN.loadComplete();
      } else {
        return refreshControllerN.loadNoData();
      }
    } else if (h == "O") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerO.loadComplete();
      } else {
        return refreshControllerO.loadNoData();
      }
    } else if (h == "P") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerP.loadComplete();
      } else {
        return refreshControllerP.loadNoData();
      }
    } else if (h == "Q") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerQ.loadComplete();
      } else {
        return refreshControllerQ.loadNoData();
      }
    } else if (h == "R") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerR.loadComplete();
      } else {
        return refreshControllerR.loadNoData();
      }
    } else if (h == "S") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerS.loadComplete();
      } else {
        return refreshControllerS.loadNoData();
      }
    } else if (h == "T") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerT.loadComplete();
      } else {
        return refreshControllerT.loadNoData();
      }
    } else if (h == "U") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerU.loadComplete();
      } else {
        return refreshControllerU.loadNoData();
      }
    } else if (h == "V") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerV.loadComplete();
      } else {
        return refreshControllerV.loadNoData();
      }
    } else if (h == "W") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerW.loadComplete();
      } else {
        return refreshControllerW.loadNoData();
      }
    } else if (h == "X") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerX.loadComplete();
      } else {
        return refreshControllerX.loadNoData();
      }
    } else if (h == "Y") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerY.loadComplete();
      } else {
        return refreshControllerY.loadNoData();
      }
    } else if (h == "Z") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexManga(h, currentPage);
        return refreshControllerZ.loadComplete();
      } else {
        return refreshControllerZ.loadNoData();
      }
    }
  }

  // ! fungsi refresh data index
  void refreshData(String h) async {
    if (h == "A") {
      if (refreshControllerA.initialRefresh == true) {
        mangaIndexA.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerA.refreshCompleted();
      } else {
        return refreshControllerA.refreshFailed();
      }
    } else if (h == "B") {
      if (refreshControllerB.initialRefresh == true) {
        mangaIndexB.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerB.refreshCompleted();
      } else {
        return refreshControllerB.refreshFailed();
      }
    } else if (h == "C") {
      if (refreshControllerC.initialRefresh == true) {
        mangaIndexC.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerC.refreshCompleted();
      } else {
        return refreshControllerC.refreshFailed();
      }
    } else if (h == "D") {
      if (refreshControllerD.initialRefresh == true) {
        mangaIndexD.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerD.refreshCompleted();
      } else {
        return refreshControllerD.refreshFailed();
      }
    } else if (h == "E") {
      if (refreshControllerE.initialRefresh == true) {
        mangaIndexE.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerE.refreshCompleted();
      } else {
        return refreshControllerE.refreshFailed();
      }
    } else if (h == "F") {
      if (refreshControllerF.initialRefresh == true) {
        mangaIndexF.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerF.refreshCompleted();
      } else {
        return refreshControllerF.refreshFailed();
      }
    } else if (h == "G") {
      if (refreshControllerG.initialRefresh == true) {
        mangaIndexG.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerG.refreshCompleted();
      } else {
        return refreshControllerG.refreshFailed();
      }
    } else if (h == "H") {
      if (refreshControllerH.initialRefresh == true) {
        mangaIndexH.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerH.refreshCompleted();
      } else {
        return refreshControllerH.refreshFailed();
      }
    } else if (h == "I") {
      if (refreshControllerI.initialRefresh == true) {
        mangaIndexI.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerI.refreshCompleted();
      } else {
        return refreshControllerI.refreshFailed();
      }
    } else if (h == "J") {
      if (refreshControllerJ.initialRefresh == true) {
        mangaIndexJ.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerJ.refreshCompleted();
      } else {
        return refreshControllerJ.refreshFailed();
      }
    } else if (h == "K") {
      if (refreshControllerK.initialRefresh == true) {
        mangaIndexK.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerK.refreshCompleted();
      } else {
        return refreshControllerK.refreshFailed();
      }
    } else if (h == "L") {
      if (refreshControllerL.initialRefresh == true) {
        mangaIndexL.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerL.refreshCompleted();
      } else {
        return refreshControllerL.refreshFailed();
      }
    } else if (h == "M") {
      if (refreshControllerM.initialRefresh == true) {
        mangaIndexM.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerM.refreshCompleted();
      } else {
        return refreshControllerM.refreshFailed();
      }
    } else if (h == "N") {
      if (refreshControllerN.initialRefresh == true) {
        mangaIndexN.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerN.refreshCompleted();
      } else {
        return refreshControllerN.refreshFailed();
      }
    } else if (h == "O") {
      if (refreshControllerO.initialRefresh == true) {
        mangaIndexO.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerO.refreshCompleted();
      } else {
        return refreshControllerO.refreshFailed();
      }
    } else if (h == "P") {
      if (refreshControllerP.initialRefresh == true) {
        mangaIndexP.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerP.refreshCompleted();
      } else {
        return refreshControllerP.refreshFailed();
      }
    } else if (h == "Q") {
      if (refreshControllerQ.initialRefresh == true) {
        mangaIndexQ.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerQ.refreshCompleted();
      } else {
        return refreshControllerQ.refreshFailed();
      }
    } else if (h == "R") {
      if (refreshControllerR.initialRefresh == true) {
        mangaIndexR.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerR.refreshCompleted();
      } else {
        return refreshControllerR.refreshFailed();
      }
    } else if (h == "S") {
      if (refreshControllerS.initialRefresh == true) {
        mangaIndexS.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerS.refreshCompleted();
      } else {
        return refreshControllerS.refreshFailed();
      }
    } else if (h == "T") {
      if (refreshControllerT.initialRefresh == true) {
        mangaIndexT.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerT.refreshCompleted();
      } else {
        return refreshControllerT.refreshFailed();
      }
    } else if (h == "U") {
      if (refreshControllerU.initialRefresh == true) {
        mangaIndexU.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerU.refreshCompleted();
      } else {
        return refreshControllerU.refreshFailed();
      }
    } else if (h == "V") {
      if (refreshControllerV.initialRefresh == true) {
        mangaIndexV.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerV.refreshCompleted();
      } else {
        return refreshControllerV.refreshFailed();
      }
    } else if (h == "W") {
      if (refreshControllerW.initialRefresh == true) {
        mangaIndexW.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerW.refreshCompleted();
      } else {
        return refreshControllerW.refreshFailed();
      }
    } else if (h == "X") {
      if (refreshControllerX.initialRefresh == true) {
        mangaIndexX.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerX.refreshCompleted();
      } else {
        return refreshControllerX.refreshFailed();
      }
    } else if (h == "Y") {
      if (refreshControllerY.initialRefresh == true) {
        mangaIndexY.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerY.refreshCompleted();
      } else {
        return refreshControllerY.refreshFailed();
      }
    } else if (h == "Z") {
      if (refreshControllerZ.initialRefresh == true) {
        mangaIndexZ.clear();
        currentPage = 1;
        await indexManga(h, currentPage);
        return refreshControllerZ.refreshCompleted();
      } else {
        return refreshControllerZ.refreshFailed();
      }
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
    searchController.dispose();
    searchController.dispose();
    resultManga.clear();
    super.onClose();
  }
}
