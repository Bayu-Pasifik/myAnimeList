import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/resource/Home_Manga_Widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
                  autofocus: false,
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
                                  Container(
                                    width: 200,
                                    height: 300,
                                    color: Colors.blue,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_ANIME,
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
                                          style: const TextStyle(
                                              fontSize: 15,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white),
                                        ),
                                        Center(
                                          child: Text(
                                            "${mangas.status}",
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
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                )),
              ],
            ),
          ));
        },
      ),
      Text("index"),
      Text("Genre")
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Manga Page'),
          centerTitle: true,
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
                Get.offNamed(Routes.HOME_PAGE);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text("Manga"),
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
