import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart';
import 'package:my_anime_list/app/data/model/genre_model.dart' as gen;
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:my_anime_list/app/modules/utils.dart';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart' as studio;
// import 'package:my_anime_list/app/data/model/anime_models.dart' as anime;

class HomeController extends GetxController {
  final CarouselController carouselController = CarouselController();
  late TextEditingController searchController;
  var year = 2020.obs;
  var season = 'Summer'.obs;
  var halSeason = 1.obs;
  int halStudios = 1;
  Map<String, dynamic> page = {};
  Map<String, dynamic> pageSeason = {};
  Map<String, dynamic> pageStudios = {};
  RefreshController studiosRefresh = RefreshController(initialRefresh: true);
  RefreshController seasonRefresh = RefreshController(initialRefresh: true);

  // !  variable untuk index anime
  int currentPage = 1;
  // ! variable untuk search anime
  int hal = 1;
  // ! variable untuk slider
  Rx<int> currentSlider = 0.obs;

  late Future<List<char.Character>?> characterList;
  late Future<List<gen.Genre>?> genreList;
  late Future<List?> animeTop;
  late Future<List?> animeAiring;
  late Future<List?> animeUpcoming;
  List<char.Character> listCharacterAnime = [];
  List<gen.Genre> listGenreAnime = [];
  List<dynamic> listStudios = [];
  List<dynamic> listSeasonAnime = [].obs;
  List<dynamic> resultAnime = [];
  List<dynamic> listAiringAnime = [];
  List<dynamic> listUpcoming = [];
  List<dynamic> listTopAnime = [];
  Rx<int> selectIndex = 0.obs;
  final PagingController<int, Animes> animeIndexA =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexB =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexC =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexD =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexE =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexF =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexG =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexH =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexI =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexJ =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexK =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexL =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexM =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexN =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexO =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexP =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexQ =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexR =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexS =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexT =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexU =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexV =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexW =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexX =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexY =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeIndexZ =
      PagingController<int, Animes>(firstPageKey: 1);

  final PagingController<int, Animes> animeSearch =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, Animes> animeSeason =
      PagingController<int, Animes>(firstPageKey: 1);
  final PagingController<int, studio.Studios> studioAnime =
      PagingController<int, studio.Studios>(firstPageKey: 1);

  Map<String, dynamic> dataSeason = {};

  // ! fungsi untuk pindah halaman pada home
  void chagePage(int index) {
    selectIndex.value = index;
    update();
  }

  // ! fungsi untuk ganti tema yang sudah disimpan di local storage
  final box = GetStorage();
  void changeTheme(bool val) {
    if (val == true) {
      box.write("darkmode", true);
      Get.changeTheme(ThemeData.dark());
    } else {
      box.remove("darkmode");
      Get.changeTheme(ThemeData.light());
    }
    isDarkmode.value =
        val; // Mengatur nilai isDarkmode sesuai dengan val yang diterima.
  }

  RxBool isSearch = false.obs;
  void resultQuery(String keyword, int p) async {
    try {
      Uri url = Uri.parse(
          'https://api.jikan.moe/v4/anime?q=$keyword&page=$p&sort=asc&sfw=false&genres_exclude=12,49,28');
      var response = await http.get(url);
      var tempdata = json.decode(response.body)["data"];
      var data = tempdata.map((e) => Animes.fromJson(e)).toList();
      List<Animes> listAnimeSearch = List<Animes>.from(data);

      if (listAnimeSearch.isEmpty) {
        // No data found
        Get.snackbar("Error", "No data found");
      } else {
        final nextPage = json.decode(response.body)['pagination']["has_next_page"];
        final isLastPage = nextPage == null;

        if (isLastPage) {
          animeSearch.appendLastPage(listAnimeSearch);
          // Get.snackbar("Error", "No more data");
        } else {
          animeSearch.appendPage(listAnimeSearch, hal + 1);
        }
      }
    } catch (e) {
      animeSearch.error = e;
    }
  }

  void clearSearch() {
    animeSearch.itemList?.clear();
    animeSearch.firstPageKey;
    animeSearch.refresh();
    searchController.clear();
  }

  void setIsSearching(bool value) {
    isSearch.value = value;
  }

  // ! function untuk index manga
  void indexAnime(String letter, int hal) async {
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/anime?letter=$letter&page=$hal&order_by=title&sort=asc&sfw=false&genres_exclude=12,49,28');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempmangaList = data["data"].map((e) => Animes.fromJson(e)).toList();
      List<Animes> listanime = List<Animes>.from(tempmangaList);
      page = data["pagination"];
      final isLastPage = page['has_next_page'] == false;
      if (letter == "A") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexA.appendLastPage(listanime);
        } else {
          animeIndexA.appendPage(listanime, hal + 1);
        }
      } else if (letter == "B") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexB.appendLastPage(listanime);
        } else {
          animeIndexB.appendPage(listanime, hal + 1);
        }
      } else if (letter == "C") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexC.appendLastPage(listanime);
        } else {
          animeIndexC.appendPage(listanime, hal + 1);
        }
      } else if (letter == "D") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexD.appendLastPage(listanime);
        } else {
          animeIndexD.appendPage(listanime, hal + 1);
        }
      } else if (letter == "E") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexE.appendLastPage(listanime);
        } else {
          animeIndexE.appendPage(listanime, hal + 1);
        }
      } else if (letter == "F") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexF.appendLastPage(listanime);
        } else {
          animeIndexF.appendPage(listanime, hal + 1);
        }
      } else if (letter == "G") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexG.appendLastPage(listanime);
        } else {
          animeIndexG.appendPage(listanime, hal + 1);
        }
      } else if (letter == "H") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexH.appendLastPage(listanime);
        } else {
          animeIndexH.appendPage(listanime, hal + 1);
        }
      } else if (letter == "I") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexI.appendLastPage(listanime);
        } else {
          animeIndexI.appendPage(listanime, hal + 1);
        }
      } else if (letter == "J") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexJ.appendLastPage(listanime);
        } else {
          animeIndexJ.appendPage(listanime, hal + 1);
        }
      } else if (letter == "K") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexK.appendLastPage(listanime);
        } else {
          animeIndexK.appendPage(listanime, hal + 1);
        }
      } else if (letter == "L") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexL.appendLastPage(listanime);
        } else {
          animeIndexL.appendPage(listanime, hal + 1);
        }
      } else if (letter == "M") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexM.appendLastPage(listanime);
        } else {
          animeIndexM.appendPage(listanime, hal + 1);
        }
      } else if (letter == "N") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexN.appendLastPage(listanime);
        } else {
          animeIndexN.appendPage(listanime, hal + 1);
        }
      } else if (letter == "O") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexO.appendLastPage(listanime);
        } else {
          animeIndexO.appendPage(listanime, hal + 1);
        }
      } else if (letter == "P") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexP.appendLastPage(listanime);
        } else {
          animeIndexP.appendPage(listanime, hal + 1);
        }
      } else if (letter == "Q") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexQ.appendLastPage(listanime);
        } else {
          animeIndexQ.appendPage(listanime, hal + 1);
        }
      } else if (letter == "R") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexR.appendLastPage(listanime);
        } else {
          animeIndexR.appendPage(listanime, hal + 1);
        }
      } else if (letter == "S") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexS.appendLastPage(listanime);
        } else {
          animeIndexS.appendPage(listanime, hal + 1);
        }
      } else if (letter == "T") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexT.appendLastPage(listanime);
        } else {
          animeIndexT.appendPage(listanime, hal + 1);
        }
      } else if (letter == "U") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexU.appendLastPage(listanime);
        } else {
          animeIndexU.appendPage(listanime, hal + 1);
        }
      } else if (letter == "V") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexV.appendLastPage(listanime);
        } else {
          animeIndexV.appendPage(listanime, hal + 1);
        }
      } else if (letter == "W") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexW.appendLastPage(listanime);
        } else {
          animeIndexW.appendPage(listanime, hal + 1);
        }
      } else if (letter == "X") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexX.appendLastPage(listanime);
        } else {
          animeIndexX.appendPage(listanime, hal + 1);
        }
      } else if (letter == "Y") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexY.appendLastPage(listanime);
        } else {
          animeIndexY.appendPage(listanime, hal + 1);
        }
      } else if (letter == "Z") {
        if (isLastPage) {
          Get.snackbar("Error", "No more data");
          animeIndexZ.appendLastPage(listanime);
        } else {
          animeIndexZ.appendPage(listanime, hal + 1);
        }
      }
    }
  }

  // ! fungsi untuk season anime

  void getSeason(int tahun, String musim, int p) async {
    try {
      Uri url = Uri.parse(
          'https://api.jikan.moe/v4/seasons/$tahun/$musim?page=$p&sort=asc&sfw=false&genres_exclude=12,49,28');
      var response = await http.get(url);
      var tempdata = json.decode(response.body)["data"];
      // print(tempdata);
      var data = tempdata.map((e) => Animes.fromJson(e)).toList();
      List<Animes> listAnimeSearch = List<Animes>.from(data);
      if (listAnimeSearch.isEmpty) {
        // No data found
        Get.snackbar("Error", "No data found");
      } else {
        final nextPage =
            json.decode(response.body)["pagination"]['has_next_page'];
        final isLastPage = nextPage == false;

        if (isLastPage) {
          animeSeason.appendLastPage(listAnimeSearch);
        } else {
          animeSeason.appendPage(listAnimeSearch, hal + 1);
        }
      }
    } catch (e) {
      animeSeason.error = e;
    }
  }

  RxBool isSeasonSearch = false.obs;
  void clearSeason() {
    animeSeason.itemList?.clear();
    animeSeason.firstPageKey;
    animeSeason.refresh();
  }

  void setIsSearchingSeason(bool value) {
    isSeasonSearch.value = value;
  }

  // ! fungsi untuk studios anime
  void getStudios(int p) async {
    //! Ambil data dari API
    try {
      Uri url = Uri.parse('https://api.jikan.moe/v4/producers?page=$p');
      var res = await http.get(url);
      //! Masukkan data ke dalam variable
      var data = json.decode(res.body)['data'];
      var tempStudios = data.map((e) => studio.Studios.fromJson(e)).toList();
      List<studio.Studios> listStudio = List<studio.Studios>.from(tempStudios);

      final nextPage = json.decode(res.body)["pagination"]['has_next_page'];
      final isLastPage = nextPage == false;

      if (isLastPage) {
        studioAnime.appendLastPage(listStudio);
      } else {
        studioAnime.appendPage(listStudio, hal + 1);
      }
    } catch (e) {
      studioAnime.error = e;
    }
  }

  // ! fungsi untuk genre anime
  Future<List<gen.Genre>?> getAllGenre() async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/genres/anime?filter=genres');
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

  // ! fungsi untuk charcter anime
  Future<List<char.Character>?> getCharacterAnime(int id) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/anime/$id/characters');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    // ! cek data nya apakah null atau tidak
    if (data == null || data.isEmpty) {
      return [];
    } else {
      listCharacterAnime = data.map((e) => char.Character.fromJson(e)).toList();
      // debugPrint(listGenreAnime.toString());
      update();
      return listCharacterAnime;
    }
  }

  // ! fungsi untuk top anime
  Future<List?> topAnime() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/top/anime?limit=10');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      page = data["pagination"];
      listTopAnime.addAll(tempAnimeList);
      update();
      return listTopAnime;
    } else {
      return null;
    }
  }

  // ! fungsi untuk currently Airing anime
  Future<List?> currentlyAiring() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/seasons/now');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      page = data["pagination"];
      listAiringAnime.addAll(tempAnimeList);
      update();
      return listAiringAnime;
    } else {
      return null;
    }
  }

  // ! fungsi untuk Upcoming anime
  Future<List?> upcomingAnime() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/seasons/upcoming');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      listUpcoming.addAll(tempAnimeList);
      // debugPrint(listUpcoming.toString());
      update();
      return listUpcoming;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    animeTop = topAnime();
    animeAiring = currentlyAiring();
    animeUpcoming =
        Future.delayed(const Duration(seconds: 1), () => upcomingAnime());
    genreList = Future.delayed(const Duration(seconds: 2), () => getAllGenre());
    animeIndexA.addPageRequestListener((pageKey) {
      indexAnime("A", pageKey);
    });
    animeIndexB.addPageRequestListener((pageKey) {
      indexAnime("B", pageKey);
    });
    animeIndexB.addPageRequestListener((pageKey) {
      indexAnime("C", pageKey);
    });
    animeIndexD.addPageRequestListener((pageKey) {
      indexAnime("D", pageKey);
    });
    animeIndexE.addPageRequestListener((pageKey) {
      indexAnime("E", pageKey);
    });
    animeIndexF.addPageRequestListener((pageKey) {
      indexAnime("F", pageKey);
    });
    animeIndexG.addPageRequestListener((pageKey) {
      indexAnime("G", pageKey);
    });
    animeIndexH.addPageRequestListener((pageKey) {
      indexAnime("H", pageKey);
    });
    animeIndexI.addPageRequestListener((pageKey) {
      indexAnime("I", pageKey);
    });
    animeIndexJ.addPageRequestListener((pageKey) {
      indexAnime("J", pageKey);
    });
    animeIndexK.addPageRequestListener((pageKey) {
      indexAnime("K", pageKey);
    });
    animeIndexL.addPageRequestListener((pageKey) {
      indexAnime("L", pageKey);
    });
    animeIndexM.addPageRequestListener((pageKey) {
      indexAnime("M", pageKey);
    });
    animeIndexN.addPageRequestListener((pageKey) {
      indexAnime("N", pageKey);
    });
    animeIndexO.addPageRequestListener((pageKey) {
      indexAnime("O", pageKey);
    });
    animeIndexP.addPageRequestListener((pageKey) {
      indexAnime("P", pageKey);
    });
    animeIndexQ.addPageRequestListener((pageKey) {
      indexAnime("Q", pageKey);
    });
    animeIndexR.addPageRequestListener((pageKey) {
      indexAnime("R", pageKey);
    });
    animeIndexS.addPageRequestListener((pageKey) {
      indexAnime("S", pageKey);
    });
    animeIndexT.addPageRequestListener((pageKey) {
      indexAnime("T", pageKey);
    });
    animeIndexU.addPageRequestListener((pageKey) {
      indexAnime("U", pageKey);
    });
    animeIndexV.addPageRequestListener((pageKey) {
      indexAnime("V", pageKey);
    });
    animeIndexW.addPageRequestListener((pageKey) {
      indexAnime("W", pageKey);
    });
    animeIndexX.addPageRequestListener((pageKey) {
      indexAnime("X", pageKey);
    });
    animeIndexY.addPageRequestListener((pageKey) {
      indexAnime("Y", pageKey);
    });
    animeIndexZ.addPageRequestListener((pageKey) {
      indexAnime("Z", pageKey);
    });
    animeSeason.addPageRequestListener((pageKey) {
      getSeason(year.value, season.value, pageKey);
    });
    studioAnime.addPageRequestListener((pageKey) {
      getStudios(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    searchController.clear();
    searchController.dispose();
    resultAnime.clear();
    animeSeason.dispose();
    studioAnime.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    animeIndexA.dispose();
    animeIndexB.dispose();
    animeIndexC.dispose();
    animeIndexD.dispose();
    animeIndexE.dispose();
    animeIndexF.dispose();
    animeIndexG.dispose();
    animeIndexH.dispose();
    animeIndexI.dispose();
    animeIndexJ.dispose();
    animeIndexK.dispose();
    animeIndexL.dispose();
    animeIndexM.dispose();
    animeIndexN.dispose();
    animeIndexO.dispose();
    animeIndexP.dispose();
    animeIndexQ.dispose();
    animeIndexR.dispose();
    animeIndexS.dispose();
    animeIndexT.dispose();
    animeIndexU.dispose();
    animeIndexV.dispose();
    animeIndexW.dispose();
    animeIndexX.dispose();
    animeIndexY.dispose();
    animeIndexZ.dispose();
    animeSeason.dispose();
    studioAnime.dispose();
    super.dispose();
  }
}
