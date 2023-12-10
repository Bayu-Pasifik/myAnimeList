import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import '../controllers/top_manga_controller.dart';

class TopMangaView extends GetView<TopMangaController> {
  const TopMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Top Manga',
            textAlign: TextAlign.center,
            style: GoogleFonts.breeSerif(
                textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<TopMangaController>(
          builder: (c) {
            return SmartRefresher(
                controller: c.topRefresh,
                enablePullDown: true,
                enablePullUp: true,
                onLoading: () => c.loadData(),
                onRefresh: () => c.refreshData(),
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
                  padding: const EdgeInsets.all(10),
                  itemCount: c.listTopManga.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 40,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    manga.Manga mangas = c.listTopManga[index];
                    return GestureDetector(
                      onTap: () {
                        print("id ${mangas.malId}");
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 200,
                                    height: 250,
                                    child: Image.network(
                                      mangas.images?["jpg"]?.imageUrl ??
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
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber[600],
                                ),
                                Text(
                                  "${mangas.score ?? '0'}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      shadows: [BoxShadow(blurRadius: 1)],
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ));
          },
        ));
  }
}
