import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_anime_list/app/data/model/detail_anime_character.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AnimeCharacterController extends GetxController {
  // List<detail.DetailAnimeCharacter> animeCharacter = [];
  List<char.Character> listCharacterAnime = [];
  final PanelController panelController = PanelController();

  Future<DetailAnimeCharacter>? getDetailCharacter(int id) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/characters/$id/full');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    var data = json.decode(res.body)['data'];
    var detail = DetailAnimeCharacter.fromJson(data);
    return detail;
  }

  // ! panel controller
  void toglePanel() {
    panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
  }
}
