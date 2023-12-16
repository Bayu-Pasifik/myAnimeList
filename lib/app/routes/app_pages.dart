import 'package:flutter/animation.dart';

import 'package:get/get.dart';

import '../modules/Anime_Airing/bindings/anime_airing_binding.dart';
import '../modules/Anime_Airing/views/anime_airing_view.dart';
import '../modules/Anime_Character/bindings/anime_character_binding.dart';
import '../modules/Anime_Character/views/anime_character_view.dart';
import '../modules/Anime_Upcoming/bindings/anime_upcoming_binding.dart';
import '../modules/Anime_Upcoming/views/anime_upcoming_view.dart';
import '../modules/Detail_Anime_Studio/bindings/detail_anime_studio_binding.dart';
import '../modules/Detail_Anime_Studio/views/detail_anime_studio_view.dart';
import '../modules/Detail_Manga/bindings/detail_manga_binding.dart';
import '../modules/Detail_Manga/views/detail_manga_view.dart';
import '../modules/Detail_Studios/bindings/detail_studios_binding.dart';
import '../modules/Detail_Studios/views/detail_studios_view.dart';
import '../modules/Detail_VoiceActor/bindings/detail_voice_actor_binding.dart';
import '../modules/Detail_VoiceActor/views/detail_voice_actor_view.dart';
import '../modules/Genre_Manga_Page/bindings/genre_manga_page_binding.dart';
import '../modules/Genre_Manga_Page/views/genre_manga_page_view.dart';
import '../modules/Home_Manga/bindings/home_manga_binding.dart';
import '../modules/Home_Manga/views/home_manga_view.dart';
import '../modules/Introduction/bindings/introduction_binding.dart';
import '../modules/Introduction/views/introduction_view.dart';
import '../modules/Manga_Character/bindings/manga_character_binding.dart';
import '../modules/Manga_Character/views/manga_character_view.dart';
import '../modules/Manhua_Page/bindings/manhua_page_binding.dart';
import '../modules/Manhua_Page/views/manhua_page_view.dart';
import '../modules/Manhwa_Page/bindings/manhwa_page_binding.dart';
import '../modules/Manhwa_Page/views/manhwa_page_view.dart';
import '../modules/Top_Anime/bindings/top_anime_binding.dart';
import '../modules/Top_Anime/views/top_anime_view.dart';
import '../modules/Top_Manga/bindings/top_manga_binding.dart';
import '../modules/Top_Manga/views/top_manga_view.dart';
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
        transition: Transition.native,
        transitionDuration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn),
    GetPage(
        name: _Paths.DETAIL_ANIME,
        page: () => const DetailAnimeView(),
        binding: DetailAnimeBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(seconds: 1),
        curve: Curves.linearToEaseOut),
    GetPage(
      name: _Paths.ANIME_TEST,
      page: () => const AnimeTestView(),
      binding: AnimeTestBinding(),
    ),
    GetPage(
      name: _Paths.TOP_ANIME,
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      page: () => const TopAnimeView(),
      binding: TopAnimeBinding(),
    ),
    GetPage(
      name: _Paths.ANIME_AIRING,
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      page: () => const AnimeAiringView(),
      binding: AnimeAiringBinding(),
    ),
    GetPage(
      name: _Paths.ANIME_UPCOMING,
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      page: () => const AnimeUpcomingView(),
      binding: AnimeUpcomingBinding(),
    ),
    GetPage(
      name: _Paths.GENRE_ANIME_RESULT,
      page: () => const GenreAnimeResultView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: GenreAnimeResultBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MANGA,
      page: () => const HomeMangaView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: HomeMangaBinding(),
    ),
    GetPage(
      name: _Paths.ANIME_CHARACTER,
      page: () => const AnimeCharacterView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: AnimeCharacterBinding(),
    ),
    GetPage(
      name: _Paths.MANGA_CHARACTER,
      page: () => const MangaCharacterView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: MangaCharacterBinding(),
    ),
    GetPage(
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linear,
      name: _Paths.DETAIL_MANGA,
      page: () => const DetailMangaView(),
      binding: DetailMangaBinding(),
    ),
    GetPage(
      name: _Paths.TOP_MANGA,
      page: () => const TopMangaView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: TopMangaBinding(),
    ),
    GetPage(
      name: _Paths.MANHWA_PAGE,
      page: () => const ManhwaPageView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: ManhwaPageBinding(),
    ),
    GetPage(
      name: _Paths.MANHUA_PAGE,
      page: () => const ManhuaPageView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: ManhuaPageBinding(),
    ),
    GetPage(
      name: _Paths.GENRE_MANGA_PAGE,
      page: () => const GenreMangaPageView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: GenreMangaPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_STUDIOS,
      page: () => const DetailStudiosView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: DetailStudiosBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ANIME_STUDIO,
      page: () => const DetailAnimeStudioView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: DetailAnimeStudioBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => const IntroductionView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_VOICE_ACTOR,
      page: () => const DetailVoiceActorView(),
      transition: Transition.native,
      transitionDuration: const Duration(seconds: 1),
      curve: Curves.linearToEaseOut,
      binding: DetailVoiceActorBinding(),
    ),
  ];
}
