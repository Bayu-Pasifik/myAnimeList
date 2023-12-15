import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/resource/Home_Manga_Widget.dart';
import 'package:my_anime_list/app/resource/manga_index.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_anime_list/app/data/model/genre_model.dart' as gen;
import '../controllers/home_manga_controller.dart';

class HomeMangaView extends GetView<HomeMangaController> {
  const HomeMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const HomeMangaWidget(),
      GetBuilder<HomeMangaController>(
        builder: (c) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  // autofocus: c.myFocusNode,
                  focusNode: c.myFocusNode,
                  controller: c.searchController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      hintText: 'Search Manga',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      onPressed: (() {
                        c.myFocusNode.requestFocus();
                        c.resultManga.clear();
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
                  child: (c.resultManga.isNotEmpty)
                      ? GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10),
                          itemCount: c.resultManga.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 0.8,
                                  crossAxisSpacing: 40,
                                  mainAxisExtent: 200,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, index) {
                            manga.Manga mangas = c.resultManga[index];

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: 200,
                                      height: 300,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_MANGA,
                                          arguments: mangas);
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
                                              mangas.images?['jpg']?.imageUrl ??
                                                  'Kosong',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "${mangas.title}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.breeSerif(
                                              textStyle: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                        ),
                                        Center(
                                          child: Text(
                                            "${mangas.status}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.breeSerif(
                                                textStyle: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis)),
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
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                )),
              ],
            ),
          ));
        },
      ),
      const DefaultTabController(length: 26, child: MangaIndex()),
      // ! Genre page
      AnimationLimiter(
        child: FutureBuilder<List<gen.Genre>?>(
          future: controller.genreList,
          builder: (context, snapshot) {
            // if (snapshot.data.isEmpty) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
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
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: index,
                  delay: const Duration(seconds: 2),
                  duration: const Duration(seconds: 2),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor:
                            Get.isDarkMode ? Colors.white : Colors.grey[900],
                        child: Center(
                          child: Text("${index + 1}"),
                        )),
                    title: Text(
                      "${genre.name}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.breeSerif(
                          textStyle:
                              const TextStyle(overflow: TextOverflow.ellipsis)),
                    ),
                    onTap: () {
                      Get.toNamed(Routes.GENRE_MANGA_PAGE, arguments: genre);
                    },
                  ),
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
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  controller.changeTheme(!controller.isDarkmode.value);
                },
                icon: Obx(
                  () => controller.isDarkmode.isTrue
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
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text("Chose Your Destination",
                        style: GoogleFonts.breeSerif(
                            fontSize: 20, color: Colors.white)),
                  )),
            ),
            ListTile(
              leading: const Icon(Icons.movie_creation_outlined),
              title: Text(
                "Anime",
                style: GoogleFonts.breeSerif(fontSize: 16),
              ),
              onTap: () {
                Get.offNamed(Routes.HOME);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: Text(
                "Manga",
                style: GoogleFonts.breeSerif(fontSize: 16),
              ),
              onTap: () {
                // Get.offNamed(Routes.HOME_MANGA);
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
        body: GetBuilder<HomeMangaController>(
            builder: (controller) => widgets[controller.selectIndex.value]),
        bottomNavigationBar: Obx(
          () => ConvexAppBar(
              backgroundColor:
                  controller.isDarkmode.isTrue ? Colors.grey[900] : Colors.blue,
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.search, title: 'search'),
                TabItem(icon: Icons.bookmarks_outlined, title: 'index'),
                TabItem(icon: Icons.movie_filter_outlined, title: 'Genres'),
                // TabItem(icon: Icons.cloudy_snowing, title: 'Season'),
              ],
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
