import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart' as studio;
import 'package:get/get.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import '../controllers/detail_anime_studio_controller.dart';

class DetailAnimeStudioView extends GetView<DetailAnimeStudioController> {
  const DetailAnimeStudioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    studio.Studios studios = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${studios.titles![0].title}'),
        centerTitle: true,
      ),
      body: GetBuilder<DetailAnimeStudioController>(
        builder: (c) {
          return SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: SmartRefresher(
              controller: c.animeStudioRefresh,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: () {
                c.idStudio.value = studios.malId!;
                c.refreshStudios();
              },
              onLoading: () {
                c.idStudio.value = studios.malId!;
                c.loadStudio();
              },
              footer: CustomFooter(
                builder: (context, mode) {
                  if (mode == LoadStatus.loading) {
                    return LoadingAnimationWidget.inkDrop(
                        color: const Color.fromARGB(255, 6, 98, 173), size: 50);
                  } else if (mode == LoadStatus.noMore) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "No More Data",
                          style: GoogleFonts.kurale(
                              fontSize: 25, fontWeight: FontWeight.normal),
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
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemCount: c.listAnime.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 40,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  ani.Animes animes = c.listAnime[index];
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
                            Get.toNamed(Routes.DETAIL_ANIME, arguments: animes);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 200,
                                  height: 250,
                                  child: Image.network(
                                    animes.images?["jpg"]?.imageUrl ?? 'Kosong',
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
                              Center(
                                child: Text(
                                  "${animes.status}",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
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
            ),
          ));
        },
      ),
    );
  }
}
