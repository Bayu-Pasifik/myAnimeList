import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/modules/home/controllers/home_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:my_anime_list/app/data/model/anime_model.dart' as ani;

class AnimeIndex extends StatelessWidget {
  const AnimeIndex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    // String? latter;
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.black.withOpacity(0.4),
              tabs: const [
                Tab(text: 'A'),
                Tab(text: 'B'),
                Tab(text: 'C'),
                Tab(text: 'D'),
                Tab(text: 'E'),
                Tab(text: 'F'),
                Tab(text: 'G'),
                Tab(text: 'H'),
                Tab(text: 'I'),
                Tab(text: 'J'),
                Tab(text: 'K'),
                Tab(text: 'L'),
                Tab(text: 'M'),
                Tab(text: 'N'),
                Tab(text: 'O'),
                Tab(text: 'P'),
                Tab(text: 'Q'),
                Tab(text: 'R'),
                Tab(text: 'S'),
                Tab(text: 'T'),
                Tab(text: 'U'),
                Tab(text: 'V'),
                Tab(text: 'W'),
                Tab(text: 'X'),
                Tab(text: 'Y'),
                Tab(text: 'Z'),
              ]),
        ),
        body: TabBarView(children: [
          animeByIndex("A"),
          animeByIndex("B"),
          animeByIndex("C"),
          animeByIndex("D"),
          animeByIndex("E"),
          animeByIndex("F"),
          animeByIndex("G"),
          animeByIndex("H"),
          animeByIndex("I"),
          animeByIndex("J"),
          animeByIndex("K"),
          animeByIndex("L"),
          animeByIndex("M"),
          animeByIndex("N"),
          animeByIndex("O"),
          animeByIndex("P"),
          animeByIndex("Q"),
          animeByIndex("R"),
          animeByIndex("S"),
          animeByIndex("T"),
          animeByIndex("U"),
          animeByIndex("V"),
          animeByIndex("W"),
          animeByIndex("X"),
          animeByIndex("Y"),
          animeByIndex("Z"),
        ]));
  }

  GetBuilder<HomeController> animeByIndex(String latter) {
    return GetBuilder<HomeController>(
      builder: (c) => FutureBuilder<List<ani.Anime?>>(
        future: c.indexAnime(latter),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.blue, size: 100));
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white, size: 100));
          }
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Padding(
          //     padding: const EdgeInsets.all(20),
          //     child: Center(
          //       child: LoadingAnimationWidget.staggeredDotsWave(
          //           color: Colors.blue, size: 100),
          //     ),
          //   );
          // }
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Tidak ada hasil'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              ani.Anime? anime = snapshot.data![index];
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
    );
  }

  FutureBuilder<List<ani.Anime?>> indexAnime(
      HomeController controller, String latter) {
    return FutureBuilder<List<ani.Anime?>>(
      future: controller.indexAnime(latter),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white, size: 10));
        }
        if (snapshot.data == null) {
          return const Center(
            child: Text('Data tidak ditemukan'),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final ani.Anime? anime = snapshot.data![index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL_ANIME, arguments: anime);
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
    );
  }
}
