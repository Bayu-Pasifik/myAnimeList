import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/model/anime_models.dart';
// import '../../../data/model/anime_model.dart';

class AnimeTestController extends GetxController {
  // bool isRefresh = false;
  RefreshController refreshControllerA =
      RefreshController(initialRefresh: true);
  RefreshController refreshControllerB =
      RefreshController(initialRefresh: true);
  int currentPage = 1;
  List<dynamic> animeListA = [];
  List<dynamic> animeListB = [];
  Map<String, dynamic> page = {};

  Future<List?> getAnimeA(int hal) async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/anime?a=a&page=$hal');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      //  var datum = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      // debugPrint(tempAnimeList.toString());
      page = data["pagination"];
      animeListA.addAll(tempAnimeList);
      update();
      return animeListA;
      // debugPrint(page["has_next_page"].toString());
    } else {
      return null;
    }
  }

  Future<List?> getAnimeB(int hal) async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/anime?b=a&page=$hal');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      //  var datum = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      // debugPrint(tempAnimeList.toString());
      page = data["pagination"];
      animeListB.addAll(tempAnimeList);
      update();
      return animeListB;
      // debugPrint(page["has_next_page"].toString());
    } else {
      return null;
    }
  }

  void loadDataA() async {
    if (page["has_next_page"] == true) {
      currentPage = currentPage + 1;
      update();
      print(currentPage.toString());
      await getAnimeA(currentPage);
      return refreshControllerA.loadComplete();
    }
    return refreshControllerA.loadNoData();
  }

  void refreshDataA() async {
    if (refreshControllerA.initialRefresh == true) {
      currentPage = 1;
      await getAnimeA(currentPage);
      return refreshControllerA.refreshCompleted();
    } else {
      return refreshControllerA.refreshFailed();
    }
  }

  void loadDataB() async {
    if (page["has_next_page"] == true) {
      currentPage = currentPage + 1;
      update();
      print(currentPage.toString());
      await getAnimeA(currentPage);
      return refreshControllerB.loadComplete();
    }
    return refreshControllerB.loadNoData();
  }

  void refreshDataB() async {
    if (refreshControllerB.initialRefresh == true) {
      currentPage = 1;
      await getAnimeA(currentPage);
      return refreshControllerB.refreshCompleted();
    } else {
      return refreshControllerB.refreshFailed();
    }
  }

  @override
  // TODO: implement onDeleted
  InternalFinalCallback<void> get onDelete {
    return super.onDelete;
  }

  @override
  void dispose() {
    // refreshController.dispose();
    super.dispose();
  }
}
