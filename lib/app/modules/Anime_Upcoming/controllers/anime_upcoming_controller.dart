import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';

class AnimeUpcomingController extends GetxController {
  RefreshController upcomingRefresh = RefreshController(initialRefresh: true);
  Map<String, dynamic> page = {};
  List<dynamic> listUpcoming = [];
  Rx<int> hal = 1.obs;
  // ! fungsi untuk upcoming anime
  Future<Map<String, dynamic>?> topAnime(int p) async {
    Uri url = Uri.parse(
        'https://api.jikan.moe/v4/seasons/upcoming?page=$p&sfw=false');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      page = data["pagination"];
      // debugPrint(data['has_next_page']);
      listUpcoming.addAll(tempAnimeList);
      update();
      return data;
    } else {
      return null;
    }
  }

  void refreshData() async {
    if (upcomingRefresh.initialRefresh == true) {
      hal.value = 1;
      await topAnime(hal.value);
      update();
      return upcomingRefresh.refreshCompleted();
    } else {
      return upcomingRefresh.refreshFailed();
    }
  }

  void loadData() async {
    if (page["has_next_page"] == true) {
      hal.value = hal.value + 1;
      await topAnime(hal.value);
      update();
      return upcomingRefresh.loadComplete();
    } else {
      return upcomingRefresh.loadNoData();
    }
  }
}
