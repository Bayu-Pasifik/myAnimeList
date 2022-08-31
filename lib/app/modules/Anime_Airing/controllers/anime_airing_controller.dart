import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';

class AnimeAiringController extends GetxController {
  RefreshController refrehAiring = RefreshController(initialRefresh: true);
  Map<String, dynamic> page = {};
  List<dynamic> listAiringAnime = [];
  Rx<int> hal = 1.obs;
  // ! fungsi untuk currently Airing anime
  Future<List?> currentlyAiring(int p) async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/seasons/now?page=$p');
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

  void refreshData() async {
    if (refrehAiring.initialRefresh == true) {
      hal.value = 1;
      await currentlyAiring(hal.value);
      update();
      return refrehAiring.refreshCompleted();
    } else {
      return refrehAiring.refreshFailed();
    }
  }

  void loadData() async {
    if (page["has_next_page"] == true) {
      hal.value = hal.value + 1;
      await currentlyAiring(hal.value);
      update();
      return refrehAiring.loadComplete();
    } else {
      return refrehAiring.loadNoData();
    }
  }
}
