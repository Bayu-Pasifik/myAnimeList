import 'package:get/get.dart';
// import 'package:my_anime_list/app/data/model/anime_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailAnimeController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  Rx<String> url = ''.obs;
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

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }
}
