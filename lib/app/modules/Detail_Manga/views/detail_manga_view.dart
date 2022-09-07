import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:pie_chart/pie_chart.dart';
import '../controllers/detail_manga_controller.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;

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
        body: (mangas.images != {} ||
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
                  // ! center image
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
                  // ! list information
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
                            Center(
                              child: Text(
                                "Type : ${mangas.type ?? "Unknown"} ",
                                style: GoogleFonts.breeSerif(),
                              ),
                            ),
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
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              "Genre : ",
                              style: GoogleFonts.squadaOne(fontSize: 15),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var items in mangas.genres!)
                                  (mangas.genres!.isNotEmpty)
                                      ? Expanded(
                                          child: Text(
                                            "${items.name!} | ",
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.squadaOne(),
                                          ),
                                        )
                                      : Expanded(
                                          child: Text(
                                            "Unknown",
                                            style: GoogleFonts.squadaOne(),
                                          ),
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Character",
                                style: GoogleFonts.squadaOne(
                                    fontSize: 16, color: Colors.blue[400]),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 3.5,
                              // color: Colors.red,
                              child: FutureBuilder(
                                future: Future.delayed(
                                  const Duration(seconds: 2),
                                  () => controller
                                      .getCharacterManga(mangas.malId ?? 0),
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (controller.listCharacterManga!.isEmpty) {
                                    return Center(
                                      child: Text(
                                        "No Data",
                                        style: GoogleFonts.kurale(fontSize: 16),
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    // padding: EdgeInsets.only(top: 50),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 5,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        controller.listCharacterManga?.length ??
                                            0,
                                    itemBuilder: (context, index) {
                                      char.Character character =
                                          controller.listCharacterManga![index];
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.ANIME_CHARACTER,
                                              arguments: character);
                                        },
                                        child: (controller
                                                .listCharacterManga!.isNotEmpty)
                                            ? Column(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: Get.mediaQuery.size
                                                              .width /
                                                          5,
                                                      height: Get.mediaQuery
                                                          .size.height,
                                                      // color: Colors.amber,
                                                      child: (character
                                                                  .character!
                                                                  .images!
                                                                  .jpg!
                                                                  .imageUrl !=
                                                              null)
                                                          ? Image.network(
                                                              character
                                                                      .character!
                                                                      .images
                                                                      ?.jpg
                                                                      ?.imageUrl ??
                                                                  'Kosong',
                                                              fit: BoxFit.cover,
                                                            )
                                                          : const CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    character.character?.name ??
                                                        'NaN',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "(${character.role ?? 'NaN'})",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        )),
                  ),
                  // ! Rating
                  Positioned(
                    top: Get.mediaQuery.size.height / 2.7,
                    left: Get.mediaQuery.size.height / 2.5,
                    child: Container(
                      width: Get.mediaQuery.size.width / 4,
                      height: Get.mediaQuery.size.height / 8,
                      // color: Colors.red,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: PieChart(
                              centerText: " ⭐ ${mangas.score ?? 0}",
                              dataMap: {"score": mangas.score ?? 0},
                              chartType: ChartType.ring,
                              baseChartColor: Colors.grey[300]!,
                              colorList: [Colors.blue[300]!],
                              animationDuration:
                                  const Duration(seconds: 1, milliseconds: 30),
                              initialAngleInDegree: 0,
                              totalValue: 10,
                              ringStrokeWidth: 10,
                              legendOptions:
                                  const LegendOptions(showLegends: false),
                              chartValuesOptions: const ChartValuesOptions(
                                  decimalPlaces: 1,
                                  showChartValues: false,
                                  showChartValuesOutside: true,
                                  chartValueBackgroundColor:
                                      Color.fromARGB(0, 255, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
