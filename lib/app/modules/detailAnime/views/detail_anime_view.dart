import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/data/model/anime_model.dart' as ani;
import 'package:my_anime_list/app/resource/video_item.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controllers/detail_anime_controller.dart';

class DetailAnimeView extends GetView<DetailAnimeController> {
  const DetailAnimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ani.Anime anime = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('${anime.title}'),
          centerTitle: true,
        ),
        body: ListView(
          children: [VideoItem(url: "${anime.trailer?.youtubeId ?? ''}")],
        ));
  }
}
