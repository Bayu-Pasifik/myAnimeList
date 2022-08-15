import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_anime_list/app/data/model/anime_model.dart';
import 'package:http/http.dart' as http;

void main() async {
  List<Anime> anime = [];
  // List<Anime> resultAnime = [];

  // Uri url = Uri.parse('https://api.jikan.moe/v4/anime?q=naruto');
  // var res = await http.get(url);
  // //! Masukkan data ke dalam variable
  // List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  // List tes = data!.map((e) => Anime.fromJson(e)).toList();
  // print("${tes[0].images['jpg'].smallImageUrl}");
  // print("${tes[0].title}");
  // String keyword = "dragon".replaceAll(" ", " ");
  // // keyword.replaceAll(" ", "");
  // debugPrint(keyword);
  // Uri link = Uri.parse('https://api.jikan.moe/v4/anime?q=$keyword');
  // var hasil = await http.get(link);
  // //! Masukkan data ke dalam variable
  // List? data = (json.decode(hasil.body) as Map<String, dynamic>)["data"];
  // // update();
  // //! cek data nya apakah null atau tidak

  // resultAnime = data!.map((e) => Anime.fromJson(e)).toList();
  // debugPrint("${resultAnime[0].aired?.from}");

  Uri link = Uri.parse('https://api.jikan.moe/v4/anime?letter=a');
  var hasil = await http.get(link);
  //! Masukkan data ke dalam variable
  List? data = (json.decode(hasil.body) as Map<String, dynamic>)["data"];
  anime = data!.map((e) => Anime.fromJson(e)).toList();
  debugPrint(anime.toString());
}
