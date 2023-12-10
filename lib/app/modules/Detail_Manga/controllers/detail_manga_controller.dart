import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:intl/intl.dart';

class DetailMangaController extends GetxController {
  List<char.Character>? listCharacterManga = [];
  Future<List<char.Character>?> getCharacterManga(int id) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/manga/$id/characters');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    // ! cek data nya apakah null atau tidak
    if (data == null || data.isEmpty) {
      return [];
    } else {
      listCharacterManga = data.map((e) => char.Character.fromJson(e)).toList();
      update();
      return listCharacterManga;
    }
  }

  String formatDate(String inputDate) {
    final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
    final outputFormat = DateFormat("dd-MM-yyyy");

    final date = inputFormat.parse(inputDate);
    return outputFormat.format(date);
  }

  @override
  void onClose() {
    listCharacterManga!.clear();
    super.onClose();
  }
}
