import 'dart:convert';

import 'package:flutter/cupertino.dart';
// import 'package:my_anime_list/app/data/model/anime_model.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart';
import 'package:http/http.dart' as http;
// import 'package:my_anime_list/app/data/model/anime_search.dart';

// void main() async {
//   List<Anime> anime = [];
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

//   Uri link = Uri.parse('https://api.jikan.moe/v4/anime?letter=a');
//   var hasil = await http.get(link);
//   //! Masukkan data ke dalam variable
//   List? data = (json.decode(hasil.body) as Map<String, dynamic>)["data"];
//   anime = data!.map((e) => Anime.fromJson(e)).toList();
//   debugPrint(anime.toString());
// }

// void main() async {
//   List<dynamic> anime = [];
//   List<Pagination> pagination = [];

//   Uri link = Uri.parse('https://api.jikan.moe/v4/anime?letter=a');
//   var hasil = await http.get(link);
//   //! Masukkan data ke dalam variable
//   Map<String, dynamic> data = (json.decode(hasil.body));
//   data.forEach((key, value) {
//     debugPrint("$key $value");
//     if (key == "data") {
//       anime = value.map((e) => Anime.fromJson(e)).toList();
//       debugPrint(data["data"].toString());
//       return;
//     } else if (key == "pagination") {
//       pagination = value.map((e) => Pagination.fromJson(e)).toList();
//       debugPrint(data["pagination"].toString());
//       return;
//     }
//   });

// final anjime = allAnime();
// debugPrint(anjime?.length);
// }

// void main() async {
//   List<Animes> anime = [];
//   Map<String, dynamic> animes = {};
//   Pagination pagination;
//   int currentPage = 1;
//   var url =
//       Uri.parse('https://api.jikan.moe/v4/anime?letter=a&page=$currentPage');
//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     final result = Anime.fromJson(json.decode(response.body));
//     print(result.toString());
//     // anime = result.data!;
//     // pagination = result.pagination!;
//     // debugPrint(pagination.currentPage.toString());
//     // debugPrint(anime.toString());
//     // currentPage++;
//     // List? dataAnime = (json.decode(result.body));
//     // final datapagination =
//     //     (json.decode(result.body) as Map<String, dynamic>)["pagination"];
//     // animes = dataAnime!.map((e) => Anime.fromJson(e)) as Map<String, dynamic>;
//     // pagination = datapagination;
//     // debugPrint(dataAnime.toString());
//   } else {
//     return null;
//   }
// }

// void main() async {
//   List<dynamic> nimek = [];
//   Map<String, dynamic> page = {};
//   List<dynamic> pagination = [];
//   Uri url = Uri.parse('https://api.jikan.moe/v4/anime?letter=a');
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = json.decode(response.body);
//     nimek = data["data"].map((e) => Animes.fromJson(e)).toList();
//     page = data["pagination"];
//     // debugPrint(page.toString());
//   } else {
//     return null;
//   }
// }

// void main() async {
//   List<dynamic> resultAnime = [];
//   Map<String, dynamic> pageSearch = {};

//   Uri link = Uri.parse('https://api.jikan.moe/v4/anime?q=naruto');
//   var hasil = await http.get(link);
//   //! Masukkan data ke dalam variable
//   var data = json.decode(hasil.body);
//   resultAnime = data["data"].map((e) => AnimeSearch.fromJson(e)).toList();
//   debugPrint(resultAnime[24].title.toString());
//   pageSearch = data["pagination"];
//   debugPrint(pageSearch["has_next_page"].toString());
//   // update();
//   //! cek data nya apakah null atau tidak
// }

void main() async {
  Map<String, dynamic> page = {};
  Uri url =
      Uri.parse('https://api.jikan.moe/v4/top/anime?page=1&sfw=false');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    var tempAnimeList = data["data"].map((e) => Animes.fromJson(e)).toList();
    debugPrint(data.toString());
    page = data["pagination"];
    debugPrint(data['has_next_page']);
  }
}
