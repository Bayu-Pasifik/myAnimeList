import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_anime_list/app/data/model/anime_search.dart' as aniSearch;
import 'package:my_anime_list/app/resource/video_item.dart';

import '../controllers/detail_search_controller.dart';

class DetailSearchView extends GetView<DetailSearchController> {
  const DetailSearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final aniSearch.AnimeSearch anime = Get.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailSearchView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          VideoItem(url: "${anime.trailer?.youtubeId ?? ''}"),
        ],
      ),
    );
  }
}
