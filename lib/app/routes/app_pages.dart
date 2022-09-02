import 'package:flutter/animation.dart';

import 'package:get/get.dart';

import '../modules/Anime_Airing/bindings/anime_airing_binding.dart';
import '../modules/Anime_Airing/views/anime_airing_view.dart';
import '../modules/Anime_Upcoming/bindings/anime_upcoming_binding.dart';
import '../modules/Anime_Upcoming/views/anime_upcoming_view.dart';
import '../modules/Character/bindings/character_binding.dart';
import '../modules/Character/views/character_view.dart';
import '../modules/Home_Manga/bindings/home_manga_binding.dart';
import '../modules/Home_Manga/views/home_manga_view.dart';
import '../modules/Top_Anime/bindings/top_anime_binding.dart';
import '../modules/Top_Anime/views/top_anime_view.dart';
import '../modules/animeTest/bindings/anime_test_binding.dart';
import '../modules/animeTest/views/anime_test_view.dart';
import '../modules/detailAnime/bindings/detail_anime_binding.dart';
import '../modules/detailAnime/views/detail_anime_view.dart';
import '../modules/genre_anime_result/bindings/genre_anime_result_binding.dart';
import '../modules/genre_anime_result/views/genre_anime_result_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.topLevel,
        curve: Curves.easeInOut),
    GetPage(
        name: _Paths.DETAIL_ANIME,
        page: () => const DetailAnimeView(),
        binding: DetailAnimeBinding(),
        transition: Transition.downToUp,
        curve: Curves.easeInOut),
    GetPage(
      name: _Paths.ANIME_TEST,
      page: () => const AnimeTestView(),
      binding: AnimeTestBinding(),
    ),
    GetPage(
      name: _Paths.TOP_ANIME,
      page: () => const TopAnimeView(),
      binding: TopAnimeBinding(),
    ),
    GetPage(
      name: _Paths.ANIME_AIRING,
      page: () => const AnimeAiringView(),
      binding: AnimeAiringBinding(),
    ),
    GetPage(
      name: _Paths.ANIME_UPCOMING,
      page: () => const AnimeUpcomingView(),
      binding: AnimeUpcomingBinding(),
    ),
    GetPage(
      name: _Paths.GENRE_ANIME_RESULT,
      page: () => const GenreAnimeResultView(),
      binding: GenreAnimeResultBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MANGA,
      page: () => const HomeMangaView(),
      binding: HomeMangaBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTER,
      page: () => const CharacterView(),
      binding: CharacterBinding(),
    ),
  ];
}
