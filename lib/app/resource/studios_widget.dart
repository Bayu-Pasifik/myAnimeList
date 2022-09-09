import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/modules/home/controllers/home_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart' as studio;

GetBuilder<HomeController> animeStudios() {
  return GetBuilder<HomeController>(
    builder: (c) {
      return SmartRefresher(
          controller: c.studiosRefresh,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: () => c.loadStudio(),
          onRefresh: () => c.refreshStudios(),
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
                          // color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.normal),
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
            padding: const EdgeInsets.all(10),
            itemCount: c.listStudios.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisExtent: 200,
                mainAxisSpacing: 20),
            itemBuilder: (context, index) {
              studio.Studios studios = c.listStudios[index];
              return GestureDetector(
                onTap: () {
                  // debugPrint(c.animeIndexA.toString());
                  Get.toNamed(Routes.DETAIL_STUDIOS, arguments: studios);
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
                                studios.images?.jpg?.imageUrl ?? 'Kosong',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "${studios.titles![0].title}",
                            style: const TextStyle(
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white),
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
  );
}
