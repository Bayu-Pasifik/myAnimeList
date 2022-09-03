import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/detail_anime_character.dart'
    as detail;

class AnimeCharacterController extends GetxController {
  List<detail.DetailAnimeCharacter> animeCharacter = [];
  // late Future<List<DetailAnimeCharacter>?> futureCharacter;

  Future<detail.DetailAnimeCharacter> getCharacter(int id) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/characters/$id/full');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    Map<String, dynamic> parsed = json.decode(res.body)["data"];
    // ! cek data nya apakah null atau tidak
    var data = detail.DetailAnimeCharacter.fromJson(parsed);
    // animeCharacter.addAll();

    return data;
  }

  @override
  void onInit() {
    // futureCharacter = getCharacter();
    super.onInit();
  }
}
