import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../data/model/anime_models.dart' as anim;
import '../controllers/anime_airing_controller.dart';

class AnimeAiringView extends GetView<AnimeAiringController> {
  const AnimeAiringView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Currently Airing',
            textAlign: TextAlign.center,
            style: GoogleFonts.breeSerif(
                textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<AnimeAiringController>(
          builder: (c) {
            return SmartRefresher(
                controller: c.refrehAiring,
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
                  itemCount: c.listAiringAnime.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 40,
                      mainAxisExtent: 200,
                      mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    anim.Animes animes = c.listAiringAnime[index];
                    return GestureDetector(
                      onTap: () {
                        // debugPrint(c.listAiringAnime.toString());
                        Get.toNamed(Routes.DETAIL_ANIME, arguments: animes);
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
                                      animes.images?["jpg"]?.imageUrl ??
                                          'Kosong',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${animes.title}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                ),
                                Text(
                                  "${animes.status}",
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
        ));
  }
}
