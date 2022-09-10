import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_anime_list/app/data/model/anime_models.dart';
import 'package:my_anime_list/app/data/model/genre_model.dart' as gen;
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart' as studio;

class HomeController extends GetxController {
  final CarouselController carouselController = CarouselController();
  late TextEditingController searchController;
  var year = 2020.obs;
  var season = 'Summer'.obs;
  var halSeason = 1.obs;
  int halStudios = 1;
  Map<String, dynamic> page = {};
  Map<String, dynamic> pageSearch = {};
  Map<String, dynamic> pageSeason = {};
  Map<String, dynamic> pageStudios = {};
  RefreshController studiosRefresh = RefreshController(initialRefresh: true);
  RefreshController genreRefresh = RefreshController(initialRefresh: true);
  RefreshController seasonRefresh = RefreshController(initialRefresh: true);
  RefreshController refreshControllerSearch =
      RefreshController(initialRefresh: true);
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
  List<dynamic> animeIndexA = [].obs;
  List<dynamic> animeIndexB = [].obs;
  List<dynamic> animeIndexC = [].obs;
  List<dynamic> animeIndexD = [].obs;
  List<dynamic> animeIndexE = [].obs;
  List<dynamic> animeIndexF = [].obs;
  List<dynamic> animeIndexG = [].obs;
  List<dynamic> animeIndexH = [].obs;
  List<dynamic> animeIndexI = [].obs;
  List<dynamic> animeIndexJ = [].obs;
  List<dynamic> animeIndexK = [].obs;
  List<dynamic> animeIndexL = [].obs;
  List<dynamic> animeIndexM = [].obs;
  List<dynamic> animeIndexN = [].obs;
  List<dynamic> animeIndexO = [].obs;
  List<dynamic> animeIndexP = [].obs;
  List<dynamic> animeIndexQ = [].obs;
  List<dynamic> animeIndexR = [].obs;
  List<dynamic> animeIndexS = [].obs;
  List<dynamic> animeIndexT = [].obs;
  List<dynamic> animeIndexU = [].obs;
  List<dynamic> animeIndexV = [].obs;
  List<dynamic> animeIndexW = [].obs;
  List<dynamic> animeIndexX = [].obs;
  List<dynamic> animeIndexY = [].obs;
  List<dynamic> animeIndexZ = [].obs;

  Map<String, dynamic> dataSeason = {};

  // ! fungsi untuk pindah halaman pada home
  void chagePage(int index) {
    selectIndex.value = index;
    update();
  }

  // ! fungsi untuk mencari anime berdasarkan nama
  Future<Map<String, dynamic>?> searchAnime(String keyword, int p) async {
    Uri link = Uri.parse(
        'https://api.jikan.moe/v4/anime?q=$keyword&page=$p&sfw=false');
    var hasil = await http.get(link);
    //! Masukkan data ke dalam variable
    Map<String, dynamic>? data = (json.decode(hasil.body));
    if (data == null) {
      return null;
    }
    var tempData = data["data"].map((e) => Animes?.fromJson(e)).toList();
    resultAnime.addAll(tempData);
    pageSearch = data["pagination"];
    update();
    return data;
  }

  // ! fungsi untuk index Anime
  Future<Map<String, dynamic>?> indexAnime(String letter, int hal) async {
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/anime?letter=$letter&page=$hal&order_by=title&sort=asc&sfw=false');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      if (letter == "A") {
        animeIndexA.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "B") {
        animeIndexB.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "C") {
        animeIndexC.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "D") {
        animeIndexD.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "E") {
        animeIndexE.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "F") {
        animeIndexF.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "G") {
        animeIndexG.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "H") {
        animeIndexH.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "I") {
        animeIndexI.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "J") {
        animeIndexJ.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "K") {
        animeIndexK.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "L") {
        animeIndexL.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "M") {
        animeIndexM.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "N") {
        animeIndexN.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "O") {
        animeIndexO.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "P") {
        animeIndexP.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "Q") {
        animeIndexQ.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "R") {
        animeIndexR.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "S") {
        animeIndexS.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "T") {
        animeIndexT.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "U") {
        animeIndexU.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "V") {
        animeIndexV.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "W") {
        animeIndexW.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "X") {
        animeIndexX.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "Y") {
        animeIndexY.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      } else if (letter == "Z") {
        animeIndexZ.addAll(tempAnimeList);
        update();
        page = data["pagination"];
        return data;
      }
    }
    return null;
  }

  // ! fungsi untuk season anime
  Future<Map<String, dynamic>?> getSession(
      int tahun, String musim, int p) async {
    //! Ambil data dari API
    Uri url =
        Uri.parse('https://api.jikan.moe/v4/seasons/$tahun/$musim?page=$p');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    // Map<String, dynamic> data = json.decode(res.body);
    dataSeason = json.decode(res.body);
    var tempSeason = dataSeason['data'].map((e) => Animes.fromJson(e)).toList();
    update();
    listSeasonAnime.addAll(tempSeason);
    debugPrint("Isi dataSeason anime: ${listSeasonAnime}");
    update();
    pageSeason = dataSeason['pagination'];
    update();
    return dataSeason;
  }

  // ! fungsi untuk studios anime
  Future<Map<String, dynamic>?> getStudios(int p) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/producers?page=$p');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    Map<String, dynamic> data = json.decode(res.body);
    var tempStudios =
        data['data'].map((e) => studio.Studios.fromJson(e)).toList();
    update();
    listStudios.addAll(tempStudios);
    update();
    pageStudios = data['pagination'];
    update();
    return data;
  }

  // ! fungsi untuk genre anime
  Future<List<gen.Genre>?> getAllGenre() async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/genres/anime');
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

  // ! fungsi untuk Upcoming Airing anime
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

  // ! fungsi load data index
  void loadData(String h) async {
    if (h == "A") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerA.loadComplete();
      } else {
        return refreshControllerA.loadNoData();
      }
    } else if (h == "B") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerB.loadComplete();
      } else {
        return refreshControllerB.loadNoData();
      }
    } else if (h == "C") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerC.loadComplete();
      } else {
        return refreshControllerC.loadNoData();
      }
    } else if (h == "D") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerD.loadComplete();
      } else {
        return refreshControllerD.loadNoData();
      }
    } else if (h == "E") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerE.loadComplete();
      } else {
        return refreshControllerE.loadNoData();
      }
    } else if (h == "F") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerF.loadComplete();
      } else {
        return refreshControllerF.loadNoData();
      }
    } else if (h == "G") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerG.loadComplete();
      } else {
        return refreshControllerG.loadNoData();
      }
    } else if (h == "H") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerH.loadComplete();
      } else {
        return refreshControllerH.loadNoData();
      }
    } else if (h == "I") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerI.loadComplete();
      } else {
        return refreshControllerI.loadNoData();
      }
    } else if (h == "J") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerJ.loadComplete();
      } else {
        return refreshControllerJ.loadNoData();
      }
    } else if (h == "K") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerK.loadComplete();
      } else {
        return refreshControllerK.loadNoData();
      }
    } else if (h == "L") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerK.loadComplete();
      } else {
        return refreshControllerK.loadNoData();
      }
    } else if (h == "L") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerK.loadComplete();
      } else {
        return refreshControllerK.loadNoData();
      }
    } else if (h == "M") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerM.loadComplete();
      } else {
        return refreshControllerM.loadNoData();
      }
    } else if (h == "N") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerN.loadComplete();
      } else {
        return refreshControllerN.loadNoData();
      }
    } else if (h == "O") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerO.loadComplete();
      } else {
        return refreshControllerO.loadNoData();
      }
    } else if (h == "P") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerP.loadComplete();
      } else {
        return refreshControllerP.loadNoData();
      }
    } else if (h == "Q") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerQ.loadComplete();
      } else {
        return refreshControllerQ.loadNoData();
      }
    } else if (h == "R") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerR.loadComplete();
      } else {
        return refreshControllerR.loadNoData();
      }
    } else if (h == "S") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerS.loadComplete();
      } else {
        return refreshControllerS.loadNoData();
      }
    } else if (h == "T") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerT.loadComplete();
      } else {
        return refreshControllerT.loadNoData();
      }
    } else if (h == "U") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerU.loadComplete();
      } else {
        return refreshControllerU.loadNoData();
      }
    } else if (h == "V") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerV.loadComplete();
      } else {
        return refreshControllerV.loadNoData();
      }
    } else if (h == "W") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerW.loadComplete();
      } else {
        return refreshControllerW.loadNoData();
      }
    } else if (h == "X") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerX.loadComplete();
      } else {
        return refreshControllerX.loadNoData();
      }
    } else if (h == "Y") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
        return refreshControllerY.loadComplete();
      } else {
        return refreshControllerY.loadNoData();
      }
    } else if (h == "Z") {
      if (page["has_next_page"] == true) {
        currentPage = currentPage + 1;
        update();
        await indexAnime(h, currentPage);
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
        animeIndexA.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerA.refreshCompleted();
      } else {
        return refreshControllerA.refreshFailed();
      }
    } else if (h == "B") {
      if (refreshControllerB.initialRefresh == true) {
        animeIndexB.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerB.refreshCompleted();
      } else {
        return refreshControllerB.refreshFailed();
      }
    } else if (h == "C") {
      if (refreshControllerC.initialRefresh == true) {
        animeIndexC.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerC.refreshCompleted();
      } else {
        return refreshControllerC.refreshFailed();
      }
    } else if (h == "D") {
      if (refreshControllerD.initialRefresh == true) {
        animeIndexD.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerD.refreshCompleted();
      } else {
        return refreshControllerD.refreshFailed();
      }
    } else if (h == "E") {
      if (refreshControllerE.initialRefresh == true) {
        animeIndexE.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerE.refreshCompleted();
      } else {
        return refreshControllerE.refreshFailed();
      }
    } else if (h == "F") {
      if (refreshControllerF.initialRefresh == true) {
        animeIndexF.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerF.refreshCompleted();
      } else {
        return refreshControllerF.refreshFailed();
      }
    } else if (h == "G") {
      if (refreshControllerG.initialRefresh == true) {
        animeIndexG.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerG.refreshCompleted();
      } else {
        return refreshControllerG.refreshFailed();
      }
    } else if (h == "H") {
      if (refreshControllerH.initialRefresh == true) {
        animeIndexH.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerH.refreshCompleted();
      } else {
        return refreshControllerH.refreshFailed();
      }
    } else if (h == "I") {
      if (refreshControllerI.initialRefresh == true) {
        animeIndexI.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerI.refreshCompleted();
      } else {
        return refreshControllerI.refreshFailed();
      }
    } else if (h == "J") {
      if (refreshControllerJ.initialRefresh == true) {
        animeIndexJ.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerJ.refreshCompleted();
      } else {
        return refreshControllerJ.refreshFailed();
      }
    } else if (h == "K") {
      if (refreshControllerK.initialRefresh == true) {
        animeIndexK.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerK.refreshCompleted();
      } else {
        return refreshControllerK.refreshFailed();
      }
    } else if (h == "L") {
      if (refreshControllerL.initialRefresh == true) {
        animeIndexL.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerL.refreshCompleted();
      } else {
        return refreshControllerL.refreshFailed();
      }
    } else if (h == "M") {
      if (refreshControllerM.initialRefresh == true) {
        animeIndexM.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerM.refreshCompleted();
      } else {
        return refreshControllerM.refreshFailed();
      }
    } else if (h == "N") {
      if (refreshControllerN.initialRefresh == true) {
        animeIndexN.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerN.refreshCompleted();
      } else {
        return refreshControllerN.refreshFailed();
      }
    } else if (h == "O") {
      if (refreshControllerO.initialRefresh == true) {
        animeIndexO.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerO.refreshCompleted();
      } else {
        return refreshControllerO.refreshFailed();
      }
    } else if (h == "P") {
      if (refreshControllerP.initialRefresh == true) {
        animeIndexP.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerP.refreshCompleted();
      } else {
        return refreshControllerP.refreshFailed();
      }
    } else if (h == "Q") {
      if (refreshControllerQ.initialRefresh == true) {
        animeIndexQ.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerQ.refreshCompleted();
      } else {
        return refreshControllerQ.refreshFailed();
      }
    } else if (h == "R") {
      if (refreshControllerR.initialRefresh == true) {
        animeIndexR.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerR.refreshCompleted();
      } else {
        return refreshControllerR.refreshFailed();
      }
    } else if (h == "S") {
      if (refreshControllerS.initialRefresh == true) {
        animeIndexS.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerS.refreshCompleted();
      } else {
        return refreshControllerS.refreshFailed();
      }
    } else if (h == "T") {
      if (refreshControllerT.initialRefresh == true) {
        animeIndexT.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerT.refreshCompleted();
      } else {
        return refreshControllerT.refreshFailed();
      }
    } else if (h == "U") {
      if (refreshControllerU.initialRefresh == true) {
        animeIndexU.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerU.refreshCompleted();
      } else {
        return refreshControllerU.refreshFailed();
      }
    } else if (h == "V") {
      if (refreshControllerV.initialRefresh == true) {
        animeIndexV.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerV.refreshCompleted();
      } else {
        return refreshControllerV.refreshFailed();
      }
    } else if (h == "W") {
      if (refreshControllerW.initialRefresh == true) {
        animeIndexW.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerW.refreshCompleted();
      } else {
        return refreshControllerW.refreshFailed();
      }
    } else if (h == "X") {
      if (refreshControllerX.initialRefresh == true) {
        animeIndexX.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerX.refreshCompleted();
      } else {
        return refreshControllerX.refreshFailed();
      }
    } else if (h == "Y") {
      if (refreshControllerY.initialRefresh == true) {
        animeIndexY.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerY.refreshCompleted();
      } else {
        return refreshControllerY.refreshFailed();
      }
    } else if (h == "Z") {
      if (refreshControllerZ.initialRefresh == true) {
        animeIndexZ.clear();
        currentPage = 1;
        await indexAnime(h, currentPage);
        return refreshControllerZ.refreshCompleted();
      } else {
        return refreshControllerZ.refreshFailed();
      }
    }
  }

  void refreshSearch(String key) async {
    if (refreshControllerSearch.initialRefresh == true) {
      hal = 1;
      await searchAnime(key, hal);
      update();
      return refreshControllerSearch.refreshCompleted();
    } else {
      return refreshControllerSearch.refreshFailed();
    }
  }

  void loadSearch(String key) async {
    if (pageSearch["has_next_page"] == true) {
      hal = hal + 1;
      await searchAnime(key, hal);
      debugPrint(hal.toString());
      update();
      return refreshControllerSearch.loadComplete();
    } else {
      return refreshControllerSearch.loadNoData();
    }
  }

  void refreshSeason(int th, String key) async {
    if (seasonRefresh.initialRefresh == true) {
      listSeasonAnime.clear();
      halSeason.value = 1;
      update();
      await getSession(year.value, season.value, halSeason.value);
      update();
      return seasonRefresh.refreshCompleted();
    } else {
      return seasonRefresh.refreshFailed();
    }
  }

  void loadSeason(int th, String key) async {
    if (pageSeason["has_next_page"] == true) {
      halSeason = halSeason + 1;
      update();
      await getSession(year.value, season.value, halSeason.value);
      update();
      return seasonRefresh.loadComplete();
    } else {
      Get.snackbar("No Data", "There is no more data",
          snackPosition: SnackPosition.BOTTOM);
      pageSeason.clear();
      return seasonRefresh.loadNoData();
    }
  }

  void refreshStudios() async {
    if (studiosRefresh.initialRefresh == true) {
      // ls.clear();
      halStudios = 1;
      update();
      await getStudios(halStudios);
      update();
      return studiosRefresh.refreshCompleted();
    } else {
      return studiosRefresh.refreshFailed();
    }
  }

  void loadStudio() async {
    if (pageStudios["has_next_page"] == true) {
      // debugPrint(pageSeason["has_next_page"].toString());
      halStudios = halStudios + 1;
      update();
      await getStudios(halStudios);
      update();
      return studiosRefresh.loadComplete();
    } else {
      Get.snackbar("No Data", "There is no more data",
          snackPosition: SnackPosition.BOTTOM);
      pageSeason.clear();
      return studiosRefresh.loadNoData();
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

    super.onInit();
  }

  @override
  void onClose() {
    searchController.clear();
    searchController.dispose();
    resultAnime.clear();
    super.onClose();
  }

  @override
  void dispose() {
    // refreshControllerA.dispose();
    // refreshControllerB.dispose();
    // refreshControllerC.dispose();
    // refreshControllerD.dispose();
    // refreshControllerE.dispose();
    // refreshControllerF.dispose();
    // refreshControllerG.dispose();
    // refreshControllerH.dispose();
    // refreshControllerI.dispose();
    // refreshControllerJ.dispose();
    // refreshControllerK.dispose();
    // refreshControllerL.dispose();
    // refreshControllerM.dispose();
    // refreshControllerN.dispose();
    // refreshControllerO.dispose();
    // refreshControllerP.dispose();
    // refreshControllerQ.dispose();
    // refreshControllerR.dispose();
    // refreshControllerS.dispose();
    // refreshControllerT.dispose();
    // refreshControllerU.dispose();
    // refreshControllerV.dispose();
    // refreshControllerW.dispose();
    // refreshControllerX.dispose();
    // refreshControllerY.dispose();
    // refreshControllerZ.dispose();
    // resultAnime.clear();
    // animeIndexA.clear();
    // animeIndexB.clear();
    // animeIndexC.clear();
    // animeIndexD.clear();
    // animeIndexE.clear();
    // animeIndexF.clear();
    // animeIndexG.clear();
    // animeIndexH.clear();
    // animeIndexI.clear();
    // animeIndexJ.clear();
    // animeIndexK.clear();
    // animeIndexL.clear();
    // animeIndexM.clear();
    // animeIndexN.clear();
    // animeIndexO.clear();
    // animeIndexP.clear();
    // animeIndexQ.clear();
    // animeIndexR.clear();
    // animeIndexS.clear();
    // animeIndexT.clear();
    // animeIndexU.clear();
    // animeIndexV.clear();
    // animeIndexW.clear();
    // animeIndexX.clear();
    // animeIndexY.clear();
    // animeIndexZ.clear();
    // listAiringAnime.clear();
    // listTopAnime.clear();
    // listUpcoming.clear();
    // searchController.clear();
    // searchController.dispose();
    super.dispose();
  }
}
