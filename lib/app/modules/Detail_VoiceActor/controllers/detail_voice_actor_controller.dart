import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:my_anime_list/app/data/model/detail_voiceActor_model.dart'
    as va;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailVoiceActorController extends GetxController {
  final PanelController panelController = PanelController();

  Future<va.DetailVoiceActor> getPeople(int id) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/people/$id/full');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    Map<String, dynamic> parsed = json.decode(res.body)["data"];
    // ! cek data nya apakah null atau tidak
    var data = va.DetailVoiceActor.fromJson(parsed);
    return data;
  }
  String formatDate(String? inputDate) {
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

  void toglePanel() {
    panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
  }
}
