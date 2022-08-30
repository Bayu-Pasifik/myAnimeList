import 'package:get/get.dart';

import '../modules/Detail_Search/bindings/detail_search_binding.dart';
import '../modules/Detail_Search/views/detail_search_view.dart';
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

  static const INITIAL = Routes.ANIME_TEST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ANIME,
      page: () => const DetailAnimeView(),
      binding: DetailAnimeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
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
  ];
}
