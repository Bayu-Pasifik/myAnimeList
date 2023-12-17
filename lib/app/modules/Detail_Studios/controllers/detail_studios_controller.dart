import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:my_anime_list/app/data/model/anime_models.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart';

class DetailStudiosController extends GetxController {
  final PanelController panelController = PanelController();
  Studios studios = Get.arguments;
  Map<String, dynamic> pageAnime = {};
  final PagingController<int, Animes> animeByStudio =
      PagingController<int, Animes>(firstPageKey: 1);
  int halAnime = 1;
  var idStudio = 1.obs;
  // ! fungsi untuk anime pada sebuah studio
  void getAnimeStudioLimit(int id) async {
    //! Ambil data dari API
    Uri url = Uri.parse('https://api.jikan.moe/v4/anime?producers=$id&limit=10');
    var res = await http.get(url);
    //! Masukkan data ke dalam variable
    Map<String, dynamic> data = json.decode(res.body);
    var tempAnime = data['data'].map((e) => Animes.fromJson(e)).toList();
    List<Animes> listAnimeByStudio = List<Animes>.from(tempAnime);
    if (listAnimeByStudio.isEmpty) {
      // No data found
      Get.snackbar("Error", "No data found");
    } else {
      // final nextPage = json.decode(res.body)["pagination"]['has_next_page'];
      // final isLastPage = nextPage == false;
    
        animeByStudio.appendLastPage(listAnimeByStudio);
      
    }
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

  @override
  void onInit() {
    animeByStudio.addPageRequestListener((pageKey) {
      getAnimeStudioLimit(studios.malId!);
    });
    super.onInit();
  }

  @override
  void dispose() {
    animeByStudio.dispose();
    super.dispose();
  }

  // ! panel controller
  void toglePanel() {
    panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
  }
}
