import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import '../controllers/detail_manga_controller.dart';

class DetailMangaView extends GetView<DetailMangaController> {
  const DetailMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final manga.Manga mangas = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('${mangas.title}'),
          elevation: 0,
          centerTitle: true,
        ),
        body: (mangas.images?['jpg']!.largeImageUrl!.length != 0 ||
                mangas.title != null ||
                mangas.titleJapanese != null ||
                mangas.synopsis != null ||
                mangas.chapters != null ||
                mangas.volumes != null)
            ? Stack(
                children: [
                  Container(
                    width: Get.mediaQuery.size.width,
                    height: Get.mediaQuery.size.height,
                    // color: Colors.amber,
                    child: (mangas.images?['jpg']?.largeImageUrl != null)
                        ? Image.network(
                            mangas.images?['jpg']?.largeImageUrl ?? '',
                            fit: BoxFit.cover,
                          )
                        : const CircularProgressIndicator(),
                  ),
                  Positioned(
                    top: Get.mediaQuery.size.height / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: Get.mediaQuery.size.width,
                        height: Get.mediaQuery.size.height,
                        color: const Color.fromARGB(255, 248, 247, 247),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.mediaQuery.size.height / 4,
                    left: Get.mediaQuery.size.height / 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: Get.mediaQuery.size.width / 3,
                        height: Get.mediaQuery.size.height / 4,
                        color: Colors.green,
                        child: Image.network(
                          mangas.images?['jpg']?.imageUrl ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.mediaQuery.size.height / 1.9,
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Container(
                        width: Get.mediaQuery.size.width,
                        height: Get.mediaQuery.size.height,
                        // color: Colors.blue,
                        child: ListView(
                          padding: const EdgeInsets.only(left: 10),
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Center(
                                    child: Text(
                                  "${mangas.title}",
                                  style: GoogleFonts.robotoSlab(fontSize: 18),
                                ))),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              "( ${mangas.titleJapanese} )",
                              style: GoogleFonts.notoSans(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: (mangas.authors!.isNotEmpty)
                                    ? Text(
                                        "By ${mangas.authors![0].name} ",
                                        style:
                                            GoogleFonts.breeSerif(fontSize: 16),
                                      )
                                    : Text(
                                        "By Unknwon ",
                                        style:
                                            GoogleFonts.breeSerif(fontSize: 16),
                                      )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (mangas.chapters != null)
                                    ? Text(
                                        "${mangas.chapters} Chapters | ",
                                        style:
                                            GoogleFonts.squadaOne(fontSize: 15),
                                      )
                                    : Text(
                                        "Unknown Chapters | ",
                                        style:
                                            GoogleFonts.squadaOne(fontSize: 15),
                                      ),
                                (mangas.volumes != null)
                                    ? Text(
                                        "${mangas.volumes} Volumes | ",
                                        style:
                                            GoogleFonts.squadaOne(fontSize: 15),
                                      )
                                    : Text(
                                        "Unknown Volumes | ",
                                        style:
                                            GoogleFonts.squadaOne(fontSize: 15),
                                      ),
                                Text(
                                  "${mangas.status}",
                                  style: GoogleFonts.squadaOne(fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ExpandablePanel(
                              header: Text(
                                "Synopsis",
                                style: GoogleFonts.squadaOne(
                                    fontSize: 16, color: Colors.blue[400]),
                              ),
                              collapsed: Text(
                                "${mangas.synopsis}",
                                style: GoogleFonts.kurale(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              expanded: Text(
                                "${mangas.synopsis}",
                                style: GoogleFonts.kurale(fontSize: 16),
                                softWrap: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}