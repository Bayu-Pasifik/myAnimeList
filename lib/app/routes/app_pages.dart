import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../modules/Anime_Airing/bindings/anime_airing_binding.dart';
import '../modules/Anime_Airing/views/anime_airing_view.dart';
import '../modules/Anime_Upcoming/bindings/anime_upcoming_binding.dart';
import '../modules/Anime_Upcoming/views/anime_upcoming_view.dart';
import '../modules/Detail_Search/bindings/detail_search_binding.dart';
import '../modules/Detail_Search/views/detail_search_view.dart';
import '../modules/Top_Anime/bindings/top_anime_binding.dart';
import '../modules/Top_Anime/views/top_anime_view.dart';
import '../modules/animeTest/bindings/anime_test_binding.dart';
import '../modules/animeTest/views/anime_test_view.dart';
import '../modules/detailAnime/bindings/detail_anime_binding.dart';
import '../modules/detailAnime/views/detail_anime_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/index/bindings/index_binding.dart';
import '../modules/index/views/index_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

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
        name: _Paths.SEARCH,
        page: () => const SearchView(),
        binding: SearchBinding(),
        transition: Transition.topLevel,
        curve: Curves.easeInOut),
    GetPage(
      name: _Paths.INDEX,
      page: () => const IndexView(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_SEARCH,
      page: () => const DetailSearchView(),
      binding: DetailSearchBinding(),
    ),
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
  ];
}
