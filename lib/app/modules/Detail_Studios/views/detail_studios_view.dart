import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart' as studio;
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../controllers/detail_studios_controller.dart';

class DetailStudiosView extends GetView<DetailStudiosController> {
  const DetailStudiosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    studio.Studios studios = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${studios.titles![0].title}',
            textAlign: TextAlign.center,
            style: GoogleFonts.breeSerif(
                textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
          ),
          centerTitle: true,
        ),
        body: SlidingUpPanel(
          maxHeight: Get.mediaQuery.size.height * 0.63,
          controller: controller.panelController,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          backdropColor: Colors.amber,
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 32, 32, 32)
              : const Color.fromARGB(255, 220, 220, 220),
          parallaxEnabled: true,
          parallaxOffset: 0.5,
          padding: const EdgeInsets.all(10),
          panel: SizedBox(
            width: 200,
            height: Get.mediaQuery.size.height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // ! sliding panel
                GestureDetector(
                  onTap: () => controller.toglePanel(),
                  child: UnconstrainedBox(
                    child: Container(
                      height: 5,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ! center image
                UnconstrainedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: Get.mediaQuery.size.width / 3,
                      height: Get.mediaQuery.size.height / 4,
                      color: Colors.green,
                      child: Image.network(
                        studios.images?.jpg?.imageUrl ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // ! title
                Center(
                    child: Text(
                  "${studios.titles![0].title}",
                  style: GoogleFonts.robotoSlab(fontSize: 18),
                )),
                const SizedBox(
                  height: 10,
                ),
                // ! japanese title
                Center(
                    child: Text(
                  "( ${studios.titles![1].title} )",
                  style: GoogleFonts.notoSans(
                      fontSize: 15, fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "Established At : ",
                      style: GoogleFonts.squadaOne(fontSize: 15),
                    )),
                    Center(
                        child: Text(
                      studios.established!.replaceAll("T00:00:00+00:00", ""),
                      style: GoogleFonts.squadaOne(fontSize: 15),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // ! total created anime
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      "Total Anime Created : ",
                      style: GoogleFonts.squadaOne(fontSize: 15),
                    )),
                    Center(
                        child: Text(
                      "${studios.count}",
                      style: GoogleFonts.squadaOne(fontSize: 15),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // ! Favorites
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Favorites : ",
                      style: GoogleFonts.squadaOne(fontSize: 15),
                    ),
                    Text(
                      "${studios.favorites}",
                      style: GoogleFonts.squadaOne(fontSize: 15),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 20,
                ),
                // ! Description
                ExpandablePanel(
                  theme: ExpandableThemeData(
                      iconColor: Get.isDarkMode ? Colors.white : Colors.black),
                  header: Text(
                    "Description",
                    style: GoogleFonts.squadaOne(
                        fontSize: 16, color: Colors.blue[400]),
                  ),
                  collapsed: Text(
                    "${studios.about}",
                    style: GoogleFonts.kurale(
                        fontSize: 16, fontWeight: FontWeight.normal),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    "${studios.about}",
                    style: GoogleFonts.kurale(fontSize: 16),
                    softWrap: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ! anime created
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Created Anime",
                      style: GoogleFonts.squadaOne(
                          fontSize: 16, color: Colors.blue[400]),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.DETAIL_ANIME_STUDIO,
                              arguments: studios);
                        },
                        child: Text(
                          "Load More",
                          style: GoogleFonts.squadaOne(
                              fontSize: 16, color: Colors.blue[400]),
                        ))
                  ],
                ),
                // ! list anime created
                Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: Get.mediaQuery.size.width,
                    // color: Colors.red,
                    child: (studios.malId != null)
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            // color: Colors.red,
                            child: FutureBuilder<Map<String, dynamic>?>(
                              future: controller.getAnimeStudio(
                                  studios.malId ?? 0, 1),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (snapshot.hasData) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (snapshot.data == null) {
                                    return const Center(
                                      child: Text("No Data"),
                                    );
                                  }
                                }
                                return ListView.separated(
                                  // shrinkWrap: true,
                                  // physics: NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 5,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.listAnime.length,
                                  itemBuilder: (context, index) {
                                    ani.Animes animes =
                                        controller.listAnime[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.DETAIL_ANIME,
                                            arguments: animes);
                                      },
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SizedBox(
                                                width: 150,
                                                height: 300,
                                                // color: Colors.amber,
                                                child: (animes.images?['jpg']
                                                            ?.imageUrl !=
                                                        null)
                                                    ? Image.network(
                                                        animes.images?['jpg']
                                                                ?.imageUrl ??
                                                            'Kosong',
                                                        fit: BoxFit.cover,
                                                      )
                                                    : const CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "( ${animes.title ?? 'NaN'} )",
                                            style: GoogleFonts.breeSerif(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "(${animes.status ?? 'NaN'})",
                                              style: GoogleFonts.breeSerif(
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))
              ],
            ),
          ),
          body: SizedBox(
            width: Get.mediaQuery.size.width,
            height: Get.mediaQuery.size.height,
            child: Image.network(
              studios.images?.jpg?.imageUrl ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
