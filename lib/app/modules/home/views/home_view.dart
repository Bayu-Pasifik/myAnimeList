import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:my_anime_list/app/data/model/anime_model.dart' as ani;
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import 'package:my_anime_list/app/resource/404_page.dart';
import 'package:my_anime_list/app/resource/anime_index.dart';
import 'package:my_anime_list/app/resource/home_widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:my_anime_list/app/data/model/season_model.dart' as ses;
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
                            color: Color.fromARGB(255, 6, 98, 173), size: 50);
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
                                        "${animes.images?["jpg"]?.imageUrl ?? 'Kosong'}",
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
      // Text("seaason"),
      // FutureBuilder<List<ses.Season>?>(
      //   future: controller.seasonList,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     }
      //     if (snapshot.hasData) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //     }
      //     // List<String> dropDown = [
      //     //   for (var items in controller.listSeasonAnime) items.toString()
      //     // ];
      //     return DropdownButton<String>(
      //         isExpanded: true,
      //         value: "${controller.listSeasonAnime[0].year}",
      //         items: [
      //           DropdownMenuItem(
      //             value: "Satu",
      //             child: Text("${controller.listSeasonAnime[0].seasons}"),
      //           ),
      //           DropdownMenuItem(
      //             value: "dua",
      //             child: Text("${controller.listSeasonAnime[1].seasons}"),
      //           ),
      //         ],
      //         onChanged: (value) {
      //           print(value);
      //         });
      //   },
      // ),
    ];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
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
