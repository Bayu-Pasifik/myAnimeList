import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_anime_list/app/data/model/genre_model.dart' as gen;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeMangaController extends GetxController {
  late FocusNode myFocusNode;
  late TextEditingController searchController;
  CarouselController carouselController = CarouselController();
  Rx<int> selectIndex = 0.obs;
  Rx<int> currentSlider = 0.obs;
  int hal = 1;
  var isDark = false.obs;
  Map<String, dynamic> page = {};
  Map<String, dynamic> pageSearch = {};
  late Future<List?> mangaTop;
  late Future<List?> manhwa;
  late Future<List?> manhua;
  List<dynamic> listMangaManga = [];
  List<dynamic> listManhwa = [];
  List<dynamic> listManhua = [];
  List<dynamic> resultManga = [];

  // ! inisiasi infinite scroll pagination

  final PagingController<int, manga.Manga> mangaIndexA =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexB =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexC =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexD =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexE =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexF =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexG =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexH =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexI =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexJ =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexK =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexL =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexM =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexN =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexO =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexP =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexQ =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexR =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexS =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexT =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexU =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexV =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexW =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexX =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexY =
      PagingController<int, manga.Manga>(firstPageKey: 1);
  final PagingController<int, manga.Manga> mangaIndexZ =
      PagingController<int, manga.Manga>(firstPageKey: 1);

  // ! End Section

  RefreshController refreshControllerSearch =
      RefreshController(initialRefresh: true);

  // !  variable untuk page index manga
  int currentPage = 1;

// ! variable genre manga
  late Future<List<gen.Genre>?> genreList;
  List<gen.Genre> listGenreAnime = [];
// ! fungsi untuk genre anime
  Future<List<gen.Genre>?> getAllGenre() async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/genres/manga?filter=themes');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    // ! cek data nya apakah null atau tidak
    if (data == null || data.isEmpty) {
      return [];
    } else {
      listGenreAnime = data.map((e) => gen.Genre.fromJson(e)).toList();
      // debugPrint(listGenreAnime.toString());
      update();
      return listGenreAnime;
    }
  }

// ! function untuk index manga
  void indexManga(String letter, int hal) async {
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/manga?letter=$letter&page=$hal&order_by=title&sort=asc&sfw=false&genres_exclude=12,49,28');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempmangaList =
          data["data"].map((e) => manga.Manga.fromJson(e)).toList();
      List<manga.Manga> listManga = List<manga.Manga>.from(tempmangaList);
      page = data["pagination"];
      final isLastPage = page['has_next_page'] == false;
      if (letter == "A") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexA.appendLastPage(listManga);
        } else {
          mangaIndexA.appendPage(listManga, hal + 1);
        }
      } else if (letter == "B") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexB.appendLastPage(listManga);
        } else {
          mangaIndexB.appendPage(listManga, hal + 1);
        }
      } else if (letter == "C") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexC.appendLastPage(listManga);
        } else {
          mangaIndexC.appendPage(listManga, hal + 1);
        }
      } else if (letter == "D") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexD.appendLastPage(listManga);
        } else {
          mangaIndexD.appendPage(listManga, hal + 1);
        }
      } else if (letter == "E") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexE.appendLastPage(listManga);
        } else {
          mangaIndexE.appendPage(listManga, hal + 1);
        }
      } else if (letter == "F") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexF.appendLastPage(listManga);
        } else {
          mangaIndexF.appendPage(listManga, hal + 1);
        }
      } else if (letter == "G") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexG.appendLastPage(listManga);
        } else {
          mangaIndexG.appendPage(listManga, hal + 1);
        }
      } else if (letter == "H") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexH.appendLastPage(listManga);
        } else {
          mangaIndexH.appendPage(listManga, hal + 1);
        }
      } else if (letter == "I") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexI.appendLastPage(listManga);
        } else {
          mangaIndexI.appendPage(listManga, hal + 1);
        }
      } else if (letter == "J") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexJ.appendLastPage(listManga);
        } else {
          mangaIndexJ.appendPage(listManga, hal + 1);
        }
      } else if (letter == "K") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexK.appendLastPage(listManga);
        } else {
          mangaIndexK.appendPage(listManga, hal + 1);
        }
      } else if (letter == "L") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexL.appendLastPage(listManga);
        } else {
          mangaIndexL.appendPage(listManga, hal + 1);
        }
      } else if (letter == "M") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexM.appendLastPage(listManga);
        } else {
          mangaIndexM.appendPage(listManga, hal + 1);
        }
      } else if (letter == "N") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexN.appendLastPage(listManga);
        } else {
          mangaIndexN.appendPage(listManga, hal + 1);
        }
      } else if (letter == "O") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexO.appendLastPage(listManga);
        } else {
          mangaIndexO.appendPage(listManga, hal + 1);
        }
      } else if (letter == "P") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexP.appendLastPage(listManga);
        } else {
          mangaIndexP.appendPage(listManga, hal + 1);
        }
      } else if (letter == "Q") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexQ.appendLastPage(listManga);
        } else {
          mangaIndexQ.appendPage(listManga, hal + 1);
        }
      } else if (letter == "R") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexR.appendLastPage(listManga);
        } else {
          mangaIndexR.appendPage(listManga, hal + 1);
        }
      } else if (letter == "S") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexS.appendLastPage(listManga);
        } else {
          mangaIndexS.appendPage(listManga, hal + 1);
        }
      } else if (letter == "T") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexT.appendLastPage(listManga);
        } else {
          mangaIndexT.appendPage(listManga, hal + 1);
        }
      } else if (letter == "U") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexU.appendLastPage(listManga);
        } else {
          mangaIndexU.appendPage(listManga, hal + 1);
        }
      } else if (letter == "V") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexV.appendLastPage(listManga);
        } else {
          mangaIndexV.appendPage(listManga, hal + 1);
        }
      } else if (letter == "W") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexW.appendLastPage(listManga);
        } else {
          mangaIndexW.appendPage(listManga, hal + 1);
        }
      } else if (letter == "X") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexX.appendLastPage(listManga);
        } else {
          mangaIndexX.appendPage(listManga, hal + 1);
        }
      } else if (letter == "Y") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexY.appendLastPage(listManga);
        } else {
          mangaIndexY.appendPage(listManga, hal + 1);
        }
        ;
      } else if (letter == "Z") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          mangaIndexZ.appendLastPage(listManga);
        } else {
          mangaIndexZ.appendPage(listManga, hal + 1);
        }
      }
    }
  }

  // ! function change page
  void chagePage(int index) {
    selectIndex.value = index;
    update();
  }

  // ! fungsi untuk ganti tema yang sudah disimpan di local storage
  void changeTheme() async {
    isDark.isTrue
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());

    final box = GetStorage();

    if (isDark.value == true) {
      // ! dark to light
      await box.write("themeDark", true);
    } else {
      // ! light to dark
      await box.remove("themeDark");
    }
    isDark.toggle();
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

  // ! fungsi untuk manhwa
  Future<List?> reqManga() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/manga?type=manhwa');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempMangaList =
          data["data"].map((e) => manga.Manga.fromJson(e)).toList();
      page = data["pagination"];
      // print(tempMangaList[0]);
      listManhwa.addAll(tempMangaList);
      update();
      return listManhwa;
    } else {
      return null;
    }
  }

  // ! fungsi untuk manhua
  Future<List?> getmanhua() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/manga?type=manhua');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempMangaList =
          data["data"].map((e) => manga.Manga.fromJson(e)).toList();
      page = data["pagination"];
      // print(tempMangaList[0]);
      listManhua.addAll(tempMangaList);
      update();
      return listManhua;
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

  @override
  void onInit() {
    mangaTop = Future.delayed(
      const Duration(seconds: 1),
      () => topManga(),
    );
    manhwa = Future.delayed(
        const Duration(seconds: 1, milliseconds: 20), () => reqManga());
    genreList = Future.delayed(
      const Duration(seconds: 1, milliseconds: 40),
      () => getAllGenre(),
    );
    manhua = Future.delayed(
      const Duration(seconds: 3, milliseconds: 30),
      () => getmanhua(),
    );
    searchController = TextEditingController();
    myFocusNode = FocusNode();
    mangaIndexA.addPageRequestListener((pageKey) {
      indexManga("A", pageKey);
    });
    mangaIndexB.addPageRequestListener((pageKey) {
      indexManga("B", pageKey);
    });
    mangaIndexB.addPageRequestListener((pageKey) {
      indexManga("C", pageKey);
    });
    mangaIndexD.addPageRequestListener((pageKey) {
      indexManga("D", pageKey);
    });
    mangaIndexE.addPageRequestListener((pageKey) {
      indexManga("E", pageKey);
    });
    mangaIndexF.addPageRequestListener((pageKey) {
      indexManga("F", pageKey);
    });
    mangaIndexG.addPageRequestListener((pageKey) {
      indexManga("G", pageKey);
    });
    mangaIndexH.addPageRequestListener((pageKey) {
      indexManga("H", pageKey);
    });
    mangaIndexI.addPageRequestListener((pageKey) {
      indexManga("I", pageKey);
    });
    mangaIndexJ.addPageRequestListener((pageKey) {
      indexManga("J", pageKey);
    });
    mangaIndexK.addPageRequestListener((pageKey) {
      indexManga("K", pageKey);
    });
    mangaIndexL.addPageRequestListener((pageKey) {
      indexManga("L", pageKey);
    });
    mangaIndexM.addPageRequestListener((pageKey) {
      indexManga("M", pageKey);
    });
    mangaIndexN.addPageRequestListener((pageKey) {
      indexManga("N", pageKey);
    });
    mangaIndexO.addPageRequestListener((pageKey) {
      indexManga("O", pageKey);
    });
    mangaIndexP.addPageRequestListener((pageKey) {
      indexManga("P", pageKey);
    });
    mangaIndexQ.addPageRequestListener((pageKey) {
      indexManga("Q", pageKey);
    });
    mangaIndexR.addPageRequestListener((pageKey) {
      indexManga("R", pageKey);
    });
    mangaIndexS.addPageRequestListener((pageKey) {
      indexManga("S", pageKey);
    });
    mangaIndexT.addPageRequestListener((pageKey) {
      indexManga("T", pageKey);
    });
    mangaIndexU.addPageRequestListener((pageKey) {
      indexManga("U", pageKey);
    });
    mangaIndexV.addPageRequestListener((pageKey) {
      indexManga("V", pageKey);
    });
    mangaIndexW.addPageRequestListener((pageKey) {
      indexManga("W", pageKey);
    });
    mangaIndexX.addPageRequestListener((pageKey) {
      indexManga("X", pageKey);
    });
    mangaIndexY.addPageRequestListener((pageKey) {
      indexManga("Y", pageKey);
    });
    mangaIndexZ.addPageRequestListener((pageKey) {
      indexManga("Z", pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchController.clear();
    searchController.dispose();
    resultManga.clear();
    mangaIndexA.dispose();
    mangaIndexB.dispose();
    mangaIndexC.dispose();
    mangaIndexD.dispose();
    mangaIndexE.dispose();
    mangaIndexF.dispose();
    mangaIndexG.dispose();
    mangaIndexH.dispose();
    mangaIndexI.dispose();
    mangaIndexJ.dispose();
    mangaIndexK.dispose();
    mangaIndexL.dispose();
    mangaIndexM.dispose();
    mangaIndexN.dispose();
    mangaIndexO.dispose();
    mangaIndexP.dispose();
    mangaIndexQ.dispose();
    mangaIndexR.dispose();
    mangaIndexS.dispose();
    mangaIndexT.dispose();
    mangaIndexU.dispose();
    mangaIndexV.dispose();
    mangaIndexW.dispose();
    mangaIndexX.dispose();
    mangaIndexY.dispose();
    mangaIndexZ.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    mangaIndexA.dispose();
    mangaIndexB.dispose();
    resultManga.clear();
    mangaIndexA.dispose();
    mangaIndexB.dispose();
    mangaIndexC.dispose();
    mangaIndexD.dispose();
    mangaIndexE.dispose();
    mangaIndexF.dispose();
    mangaIndexG.dispose();
    mangaIndexH.dispose();
    mangaIndexI.dispose();
    mangaIndexJ.dispose();
    mangaIndexK.dispose();
    mangaIndexL.dispose();
    mangaIndexM.dispose();
    mangaIndexN.dispose();
    mangaIndexO.dispose();
    mangaIndexP.dispose();
    mangaIndexQ.dispose();
    mangaIndexR.dispose();
    mangaIndexS.dispose();
    mangaIndexT.dispose();
    mangaIndexU.dispose();
    mangaIndexV.dispose();
    mangaIndexW.dispose();
    mangaIndexX.dispose();
    mangaIndexY.dispose();
    mangaIndexZ.dispose();
    super.dispose();
  }
}
