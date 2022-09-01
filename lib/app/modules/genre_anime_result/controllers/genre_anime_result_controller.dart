import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GenreAnimeResultController extends GetxController {
  List<dynamic> listAnime = [];
  Map<String, dynamic> page = {};
  int hal = 1;
  RefreshController genreRefresh = RefreshController(initialRefresh: true);
  // ! fungsi untuk fetching genre anime berdasarkan index
  Future<List?> genreAnime(int g, int p) async {
    Uri url = Uri.parse('https://api.jikan.moe/v4/anime?genres=$g&page=$p');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
      listAnime.addAll(tempAnimeList);
      page = data["pagination"];
      update();
      return listAnime;
    } else {
      return null;
    }
  }

  void refreshData(int gen) async {
    if (genreRefresh.initialRefresh == true) {
      hal = 1;
      await genreAnime(gen, hal);
      update();
      return genreRefresh.refreshCompleted();
    } else {
      return genreRefresh.refreshFailed();
    }
  }

  void loadData(int gen) async {
    if (page["has_next_page"] == true) {
      hal = hal + 1;
      await genreAnime(gen, hal);
      debugPrint(hal.toString());
      update();
      return genreRefresh.loadComplete();
    } else {
      return genreRefresh.loadNoData();
    }
  }
}
