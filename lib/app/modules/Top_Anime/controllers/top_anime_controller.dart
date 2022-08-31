import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';

class TopAnimeController extends GetxController {
  RefreshController topRefresh = RefreshController(initialRefresh: true);
  Map<String, dynamic> page = {};
  List<dynamic> listTopAnime = [];
  Rx<int> hal = 1.obs;
  // ! fungsi untuk top anime
  Future<Map<String, dynamic>?> topAnime(int p) async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/top/anime?page=$p&sfw=false');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      page = data["pagination"];
      debugPrint(data['has_next_page']);
      listTopAnime.addAll(tempAnimeList);
      update();
      return data;
    } else {
      return null;
    }
  }

  void refreshData() async {
    if (topRefresh.initialRefresh == true) {
      hal.value = 1;
      await topAnime(hal.value);
      update();
      return topRefresh.refreshCompleted();
    } else {
      return topRefresh.refreshFailed();
    }
  }

  void loadData() async {
    if (page["has_next_page"] == true) {
      hal.value = hal.value + 1;
      await topAnime(hal.value);
      update();
      return topRefresh.loadComplete();
    } else {
      return topRefresh.loadNoData();
    }
  }
}
