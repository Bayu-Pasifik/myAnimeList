import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailAnimeController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  Rx<String> url = ''.obs;
  List<char.Character>? listCharacterAnime = [];
  String formatDate(String? inputDate) {
    print(inputDate);
    try {
      if (inputDate == null) {
        return "-";
      }

      final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
      final outputFormat = DateFormat("dd-MM-yyyy");

      final date = inputFormat.parse(inputDate);
      return outputFormat.format(date);
    } catch (e) {
      return e.toString();
    }
  }

  @override
  void onInit() {
    super.onInit();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: url.value,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        startAt: 0,
        showLiveFullscreenButton: true,
        controlsVisibleAtStart: true,
      ),
    );
    // characterList = getCharacterAnime(id)
  }

  playervideo(String link) {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: url.value = link,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        startAt: 0,
        showLiveFullscreenButton: true,
        controlsVisibleAtStart: true,
      ),
    );
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
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    listCharacterAnime?.clear();
    super.dispose();
  }
}
