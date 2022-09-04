import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_anime_list/app/resource/Home_Manga_Widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';

import '../controllers/home_manga_controller.dart';

class HomeMangaView extends GetView<HomeMangaController> {
  const HomeMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      HomeMangaWidget(),
      Text("search"),
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
