import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_anime_list/app/data/model/anime_model.dart';
import 'dart:convert';

import 'package:my_anime_list/app/data/model/anime_search.dart';

class HomeController extends GetxController {
  late TextEditingController searchController;
  // print(searchController.text);
  List<Anime> anime = [];
  List<AnimeSearch> resultAnime = [];
  Rx<int> selectIndex = 0.obs;
  List<Anime> animeIndexA = [];
  List<Anime> animeIndexB = [];
  List<Anime> animeIndexC = [];
  List<Anime> animeIndexD = [];
  List<Anime> animeIndexE = [];
  List<Anime> animeIndexF = [];
  List<Anime> animeIndexG = [];
  List<Anime> animeIndexH = [];
  List<Anime> animeIndexI = [];
  List<Anime> animeIndexJ = [];
  List<Anime> animeIndexK = [];
  List<Anime> animeIndexL = [];
  List<Anime> animeIndexM = [];
  List<Anime> animeIndexN = [];
  List<Anime> animeIndexO = [];
  List<Anime> animeIndexP = [];
  List<Anime> animeIndexQ = [];
  List<Anime> animeIndexR = [];
  List<Anime> animeIndexS = [];
  List<Anime> animeIndexT = [];
  List<Anime> animeIndexU = [];
  List<Anime> animeIndexV = [];
  List<Anime> animeIndexW = [];
  List<Anime> animeIndexX = [];
  List<Anime> animeIndexY = [];
  List<Anime> animeIndexZ = [];

  List<String> nama = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  void chagePage(int index) {
    selectIndex.value = index;
    update();
  }

  Future<List<Anime>> allAnime() async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/anime');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    //! cek data nya apakah null atau tidak
    if (data == null || data.isEmpty) {
      return [];
    } else {
      anime = data.map((e) => Anime.fromJson(e)).toList();
      return anime;
    }
  }

  Future<List<AnimeSearch>> searchAnime(String keyword) async {
    Uri link = Uri.parse('https://api.jikan.moe/v4/anime?q=$keyword');
    var hasil = await http.get(link);
    //! Masukkan data ke dalam variable
    List? data = (json.decode(hasil.body) as Map<String, dynamic>)["data"];
    // update();
    //! cek data nya apakah null atau tidak
    if (data == null || data.isEmpty) {
      return resultAnime = [];
    } else {
      update();
      resultAnime = data.map((e) => AnimeSearch?.fromJson(e)).toList();
      return resultAnime;
    }
  }

  Future<List<Anime>> indexAnime(String latter) async {
    Uri link = Uri.parse('https://api.jikan.moe/v4/anime?letter=$latter');
    var hasil = await http.get(link);
    //! Masukkan data ke dalam variable
    List? data = (json.decode(hasil.body) as Map<String, dynamic>)["data"];
    //! cek data nya apakah null atau tidak
    if (data == null || data.isEmpty) {
      return [];
    } else {
      if (latter == "A") {
        animeIndexA = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexA;
      } else if (latter == "B") {
        animeIndexB = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexB;
      } else if (latter == "C") {
        animeIndexC = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexC;
      } else if (latter == "D") {
        animeIndexD = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexD;
      } else if (latter == "E") {
        animeIndexE = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexE;
      } else if (latter == "F") {
        animeIndexF = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexF;
      } else if (latter == "G") {
        animeIndexG = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexF;
      } else if (latter == "H") {
        animeIndexH = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexF;
      } else if (latter == "I") {
        animeIndexI = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexI;
      } else if (latter == "J") {
        animeIndexJ = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexJ;
      } else if (latter == "K") {
        animeIndexK = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexK;
      } else if (latter == "L") {
        animeIndexL = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexL;
      } else if (latter == "M") {
        animeIndexM = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexM;
      } else if (latter == "N") {
        animeIndexN = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexN;
      } else if (latter == "O") {
        animeIndexO = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexO;
      } else if (latter == "P") {
        animeIndexP = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexP;
      } else if (latter == "Q") {
        animeIndexQ = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexQ;
      } else if (latter == "R") {
        animeIndexR = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexR;
      } else if (latter == "S") {
        animeIndexS = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexS;
      } else if (latter == "T") {
        animeIndexT = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexT;
      } else if (latter == "U") {
        animeIndexU = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexU;
      } else if (latter == "V") {
        animeIndexV = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexV;
      } else if (latter == "W") {
        animeIndexW = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexW;
      } else if (latter == "X") {
        animeIndexX = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexX;
      } else if (latter == "Y") {
        animeIndexY = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexY;
      } else if (latter == "Z") {
        animeIndexZ = data.map((e) => Anime.fromJson(e)).toList();
        return animeIndexZ;
      } else {
        return [];
      }
    }
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    anime.clear();
    resultAnime.clear();
    animeIndexA.clear();
    animeIndexB.clear();
    animeIndexC.clear();
    animeIndexD.clear();
    animeIndexE.clear();
    animeIndexF.clear();
    searchController.clear();
    searchController.dispose();
    super.dispose();
  }
}
