import 'dart:async';
import 'dart:convert';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import 'package:my_anime_list/app/resource/anime_index.dart';
import 'package:my_anime_list/app/resource/home_widget.dart';
import 'package:my_anime_list/app/resource/studios_widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../data/model/genre_model.dart' as gen;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      // ! home page
      const HomeWidget(),
      // Text("home"),
      // ! search page
      GetBuilder<HomeController>(
        builder: (c) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  autofocus: false,
                  controller: c.searchController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: 'Search Anime',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: (() {
                        c.resultAnime.clear();
                        c.refreshSearch(c.searchController.text);
                      }),
                      child: const Text("Search")),
                ),
                Expanded(
                    child: SmartRefresher(
                  controller: c.refreshControllerSearch,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () => c.refreshSearch(c.searchController.text),
                  onLoading: () => c.loadSearch(c.searchController.text),
                  footer: CustomFooter(
                    builder: (context, mode) {
                      if (mode == LoadStatus.loading) {
                        return LoadingAnimationWidget.inkDrop(
                            color: const Color.fromARGB(255, 6, 98, 173),
                            size: 50);
                      }
                      return const SizedBox(
                        height: 5,
                        width: 5,
                      );
                    },
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: c.resultAnime.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 40,
                            mainAxisExtent: 200,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      ani.Animes animes = c.resultAnime[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 300,
                              color: Colors.blue,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: animes);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 200,
                                      height: 250,
                                      child: Image.network(
                                        animes.images?["jpg"]?.imageUrl ??
                                            'Kosong',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${animes.title}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white),
                                  ),
                                  Center(
                                    child: Text(
                                      "${animes.status}",
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )),
              ],
            ),
          ));
        },
      ),
      // ! index page
      const DefaultTabController(length: 26, child: AnimeIndex()),

      // ! Genre page
      FutureBuilder<List<gen.Genre>?>(
        future: controller.genreList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          return ListView.separated(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              gen.Genre genre = controller.listGenreAnime[index];
              return ListTile(
                leading: CircleAvatar(
                    child: Center(
                  child: Text("${index + 1}"),
                )),
                title: Text("${genre.name}"),
                onTap: () {
                  Get.toNamed(Routes.GENRE_ANIME_RESULT, arguments: genre);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 2,
              );
            },
          );
        },
      ),

      // ! Season Page
      GetBuilder<HomeController>(
        builder: (c) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                // ! dropdown tahun
                DropdownSearch<String>(
                  popupProps: const PopupProps.dialog(
                      showSelectedItems: true,
                      showSearchBox: true,
                      searchFieldProps: TextFieldProps(
                          keyboardType: TextInputType.numberWithOptions())),
                  asyncItems: (String filter) async {
                    Uri url = Uri.parse('https://api.jikan.moe/v4/seasons');
                    var res = await http.get(url);
                    List<String> allYear = [];
                    var data =
                        (json.decode(res.body) as Map<String, dynamic>)['data'];
                    data!.forEach(((element) {
                      allYear.add(element['year'].toString());
                    }));

                    return allYear;
                  },
                  onChanged: (yearValue) {
                    c.year.value = int.parse(yearValue!);
                    c.listSeasonAnime.clear();
                    c.pageSeason.clear();
                    c.seasonRefresh.resetNoData();
                  },
                  selectedItem: c.year.value.toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                // ! dropdown musim
                DropdownSearch<String>(
                  popupProps: const PopupProps.dialog(showSelectedItems: true),
                  items: const ["WINTER", "SPRING", "SUMMER", "FALL"],
                  onChanged: (seasonValue) {
                    c.season.value = seasonValue!;
                    c.listSeasonAnime.clear();
                    c.pageSeason.clear();
                    c.seasonRefresh.resetNoData();
                  },
                  selectedItem: c.season.value,
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: (() {
                        c.listSeasonAnime.clear();
                        c.pageSeason.clear();
                        c.refreshSeason(c.year.value, c.season.value);
                      }),
                      child: const Text("Search")),
                ),
                Expanded(
                    child: SmartRefresher(
                        controller: c.seasonRefresh,
                        enablePullDown: true,
                        enablePullUp: true,
                        onRefresh: () =>
                            c.refreshSeason(c.year.value, c.season.value),
                        onLoading: () =>
                            c.loadSeason(c.year.value, c.season.value),
                        footer: CustomFooter(
                          builder: (context, mode) {
                            if (mode == LoadStatus.loading) {
                              return LoadingAnimationWidget.inkDrop(
                                  color: const Color.fromARGB(255, 6, 98, 173),
                                  size: 50);
                            } else if (mode == LoadStatus.noMore) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "No More Data",
                                    style: GoogleFonts.kurale(
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox(
                              height: 5,
                              width: 5,
                            );
                          },
                        ),
                        child: (c.listSeasonAnime.isNotEmpty &&
                                c.dataSeason['data'] != [])
                            ? GridView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                itemCount: c.listSeasonAnime.length,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 0.8,
                                        crossAxisSpacing: 40,
                                        mainAxisExtent: 200,
                                        mainAxisSpacing: 20),
                                itemBuilder: (context, index) {
                                  ani.Animes animes = c.listSeasonAnime[index];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 200,
                                          height: 300,
                                          color: Colors.blue,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.DETAIL_ANIME,
                                                arguments: animes);
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  width: 200,
                                                  height: 250,
                                                  child: Image.network(
                                                    animes.images?["jpg"]
                                                            ?.imageUrl ??
                                                        'Kosong',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "${animes.title}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.white),
                                              ),
                                              Center(
                                                child: Text(
                                                  "${animes.status}",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : DelayedDisplay(
                                delay: const Duration(seconds: 3),
                                child: Lottie.asset(
                                    "assets/lottie/kesalahan.json")))),
              ],
            ),
          ));
        },
      ),

      // ! Studios Page
      animeStudios()
    ];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Obx(
                  () => controller.isDark.isFalse
                      ? const Icon(Icons.sunny)
                      : const Icon(Icons.mode_night_outlined),
                ))
          ],
        ),
        drawer: Drawer(
          elevation: 200,
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.blue[300],
              child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Chose Your Destination",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [BoxShadow(blurRadius: 1)],
                          fontSize: 20),
                    ),
                  )),
            ),
            ListTile(
              leading: const Icon(Icons.movie_creation_outlined),
              title: const Text("Anime"),
              onTap: () {
                // Get.offNamed(Routes.HOME_PAGE);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text("Manga"),
              onTap: () {
                Get.offNamed(Routes.HOME_MANGA);
              },
            ),
          ]),
        ),
        body: GetBuilder<HomeController>(
            builder: (controller) => widgets[controller.selectIndex.value]),
        bottomNavigationBar: Obx(
          () => ConvexAppBar(
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.search, title: 'search'),
                TabItem(icon: Icons.bookmarks_outlined, title: 'index'),
                TabItem(icon: Icons.movie_filter_outlined, title: 'Genres'),
                TabItem(icon: Icons.cloudy_snowing, title: 'Season'),
                TabItem(icon: Icons.business, title: 'Studios'),
              ],
              backgroundColor: Get.isDarkMode ? Colors.grey[900] : Colors.blue,
              initialActiveIndex: controller.selectIndex.value,
              style: TabStyle.textIn, //optional, default as 0
              onTap: (index) {
                controller.chagePage(index);
                debugPrint("index: $index");
                debugPrint("controller index: ${controller.selectIndex}");
              }),
        ));
  }
}
