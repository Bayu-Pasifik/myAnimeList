import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';

import '../../modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as anim;

GetBuilder<HomeController> animeByIndexT(HomeController controller) {
  return GetBuilder<HomeController>(
    builder: (c) {
      return SmartRefresher(
          controller: c.refreshControllerT,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: () => c.loadData("T"),
          onRefresh: () => c.refreshData("T"),
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
            itemCount: c.animeIndexT.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisExtent: 200,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              anim.Animes animes = c.animeIndexT[index];
              return GestureDetector(
                onTap: (() {
                  Get.toNamed(Routes.DETAIL_ANIME, arguments: animes);
                }),
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
  );
}
