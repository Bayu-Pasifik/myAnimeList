import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:my_anime_list/app/routes/app_pages.dart';

import '../controllers/manga_character_controller.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:my_anime_list/app/data/model/detail_anime_character.dart'
    as detailChar;

class MangaCharacterView extends GetView<MangaCharacterController> {
  const MangaCharacterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final char.CharacterClass character = Get.arguments;
    return Scaffold(
        body: FutureBuilder<detailChar.DetailAnimeCharacter>(
            future: controller.getDetailCharacter(character.malId!),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
              detailChar.DetailAnimeCharacter detail = snapshot.data!;
              print(detail.images!.jpg!.imageUrl);
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 10,
                    elevation: 0,
                    stretch: true,
                    pinned: true,
                    centerTitle: true,
                    title: Text('${detail.name}'),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: SizedBox(
                        height: 250.h,
                        width: 250.w,
                        child: CachedNetworkImage(
                          imageUrl: "${detail.images!.jpg!.imageUrl}",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) => Image.asset(
                              "assets/images/Image_not_available.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(height: 20.h),
                    ExpandablePanel(
                      theme: ExpandableThemeData(
                        iconColor: Get.isDarkMode
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0),
                      ),
                      collapsed: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            "You can view more information about this character here",
                            style: GoogleFonts.kurale(
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(255, 0, 0, 0),
                            )),
                      ),
                      header: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "About Character",
                          style: GoogleFonts.squadaOne(
                              color: Colors.blue, fontSize: 20.sp),
                        ),
                      ),
                      expanded: Padding(
                          padding: EdgeInsets.all(5),
                          child: Table(
                            border: TableBorder.all(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: Get.isDarkMode
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : const Color.fromARGB(15, 37, 37, 37),
                            ),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Full Name",
                                    style: GoogleFonts.squadaOne(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    (detail.name != "")
                                        ? "${detail.name}"
                                        : "-",
                                    style: GoogleFonts.kurale(),
                                  ),
                                )
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Kanji Name",
                                    style: GoogleFonts.squadaOne(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    (detail.nameKanji != "")
                                        ? "${detail.nameKanji}"
                                        : "-",
                                    style: GoogleFonts.kurale(),
                                  ),
                                )
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Favored By",
                                    style: GoogleFonts.squadaOne(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    (detail.favorites != 0)
                                        ? "${detail.favorites} Peoples"
                                        : "0 People",
                                    style: GoogleFonts.kurale(),
                                  ),
                                )
                              ]),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "Nicknames",
                                      style: GoogleFonts.squadaOne(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: (detail.nicknames!.isNotEmpty)
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                detail.nicknames!.map((item) {
                                              return Text(
                                                item,
                                                style: GoogleFonts.kurale(),
                                              );
                                            }).toList(),
                                          )
                                        : Text(
                                            "No Nicknames",
                                            style: GoogleFonts.kurale(),
                                          ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ExpandablePanel(
                        theme: ExpandableThemeData(
                            iconColor:
                                Get.isDarkMode ? Colors.white : Colors.black),
                        header: Text(
                          "Background Story",
                          style: GoogleFonts.squadaOne(
                              color: Colors.blue, fontSize: 20),
                        ),
                        collapsed: Text(
                          detail.about != ""
                              ? "${detail.about}"
                              : "No Background Story",
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.kurale(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        expanded: Text(
                          detail.about != ""
                              ? "${detail.about}"
                              : "No Background Story",
                          softWrap: true,
                          style: GoogleFonts.kurale(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ]))
                ],
              );
            }));
  }
}
