import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/data/model/anime_model.dart' as ani;
import 'package:my_anime_list/app/data/model/anime_search.dart' as aniSearch;
import 'package:my_anime_list/app/resource/anime_index.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      // ! home page
      Center(
        child: Text('Home'),
      ),
      // FutureBuilder<List<ani.Anime?>>(
      //   // future: Future.delayed(Duration(seconds: 1)),
      //   future: controller.allAnime(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //           child: LoadingAnimationWidget.staggeredDotsWave(
      //               color: Colors.white, size: 10));
      //     }
      //     if (snapshot.data!.isEmpty) {
      //       return const Center(
      //         child: Text('Data tidak ditemukan'),
      //       );
      //     }
      //     return ListView(
      //       children: [
      //         ListView.builder(
      //           physics: const NeverScrollableScrollPhysics(),
      //           shrinkWrap: true,
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (context, index) {
      //             ani.Anime? anime = snapshot.data![index];
      //             return GestureDetector(
      //               onTap: () {
      //                 Get.toNamed(Routes.DETAIL_ANIME, arguments: anime);
      //               },
      //               child: Material(
      //                 elevation: 10,
      //                 child: ListTile(
      //                   contentPadding: const EdgeInsets.all(20),
      //                   title: Text("${anime?.title}"),
      //                   trailing: Text("${anime?.episodes} Episode"),
      //                   subtitle: Text("${anime?.type}"),
      //                   leading: Image.network(
      //                     anime?.images?['jpg']?.smallImageUrl ?? '',
      //                     fit: BoxFit.contain,
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // ),
      // ! search page
      Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            TextField(
              onChanged: (value) => controller.searchAnime(value),
              controller: controller.searchController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: 'Search Anime',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            GetBuilder<HomeController>(
              builder: (c) => FutureBuilder<List<aniSearch.AnimeSearch?>>(
                future: c.searchAnime(c.searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white, size: 100));
                  }
                  if (snapshot.connectionState == ConnectionState.none) {
                    return Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white, size: 100));
                  }
                  if (snapshot.connectionState == ConnectionState.none) {
                    return const Center(child: Text("Connect to internet"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.blue, size: 100),
                      ),
                    );
                  }
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Tidak ada hasil'),
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      aniSearch.AnimeSearch? anime = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_SEARCH, arguments: anime);
                        },
                        child: Material(
                          elevation: 10,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(20),
                            title: Text("${anime?.title}"),
                            trailing: Text("${anime?.episodes} Episode"),
                            subtitle: Text("${anime?.type}"),
                            leading: Image.network(
                              anime?.images?['jpg']?.smallImageUrl ?? '',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // ! index page
      const DefaultTabController(length: 26, child: AnimeIndex())
    ];
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Anime Page'),
        //   centerTitle: true,
        // ),
        body: GetBuilder<HomeController>(
            builder: (controller) => widgets[controller.selectIndex.value]),
        bottomNavigationBar: Obx(
          () => ConvexAppBar(
              // controller: _tabbarController,
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.search, title: 'search'),
                TabItem(icon: Icons.bookmarks_outlined, title: 'index'),
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
