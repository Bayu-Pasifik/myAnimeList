import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/detail_anime_character.dart'
    as detail;
import 'package:my_anime_list/app/data/model/character_model.dart' as char;

class AnimeCharacterController extends GetxController {
  List<detail.DetailAnimeCharacter> animeCharacter = [];
  List<char.Character> listCharacterAnime = [];

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
      update();
      return listCharacterAnime;
    }
  }

  @override
  void onInit() {
    // futureCharacter = getCharacter();
    super.onInit();
  }
}
