import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/modules/Home_Manga/controllers/home_manga_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;

GetBuilder<HomeMangaController> mangaByIndexI(HomeMangaController controller) {
  return GetBuilder<HomeMangaController>(
    builder: (c) {
      return SmartRefresher(
          controller: c.refreshControllerI,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: () => c.loadData("I"),
          onRefresh: () => c.refreshData("I"),
          footer: CustomFooter(
            builder: (context, mode) {
              if (mode == LoadStatus.loading) {
                return LoadingAnimationWidget.inkDrop(
                    color: const Color.fromARGB(255, 6, 98, 173), size: 50);
              }
              return const SizedBox(
                height: 5,
                width: 5,
              );
            },
          ),
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: c.mangaIndexI.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisExtent: 200,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              manga.Manga mangas = c.mangaIndexI[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_MANGA, arguments: mangas);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Container(
                        width: 200,
                        height: 300,
                        color: Colors.blue,
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              height: 250,
                              child: Image.network(
                                mangas.images?["jpg"]?.imageUrl ?? 'Kosong',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "${mangas.title}",
                           textAlign: TextAlign.center,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                          ),
                          Text(
                            "${mangas.status}",
                            textAlign: TextAlign.center,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
    },
  );
}
