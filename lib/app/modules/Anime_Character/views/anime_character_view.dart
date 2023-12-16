import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
// import 'package:my_anime_list/app/data/model/detail_anime_character.dart'
//     as detail;
import 'package:my_anime_list/app/modules/utils.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
// import 'package:my_anime_list/app/routes/app_pages.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../controllers/anime_character_controller.dart';
import 'package:my_anime_list/app/data/model/detail_anime_character.dart'
    as detailChar;

class AnimeCharacterView extends GetView<AnimeCharacterController> {
  const AnimeCharacterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final ani.Animes anime = Get.arguments['anime'];
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
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: 280.h,
                        width: 180.w,
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
                        iconColor: isDarkmode.isTrue || getDarkmode
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0),
                      ),
                      collapsed: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            "You can view more information about this character here",
                            style: GoogleFonts.kurale(
                              fontWeight: FontWeight.w500,
                              color: isDarkmode.isTrue || getDarkmode
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
                          padding: const EdgeInsets.all(5),
                          child: Table(
                            border: TableBorder.all(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: isDarkmode.isTrue || getDarkmode
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
                            iconColor: isDarkmode.isTrue || getDarkmode
                                ? Colors.white
                                : Colors.black),
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
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Voice Actors / Actresses",
                        style: GoogleFonts.squadaOne(
                            color: Colors.blue, fontSize: 20),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            // color: Colors.red,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: 5.w,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: detail.voices?.length ?? 0,
                              itemBuilder: (context, index) {
                                // char.Character character =
                                //     controller.listCharacterAnime?[index];
                                return GestureDetector(
                                  onTap: () {
                                    // print(character.character!.malId);
                                    Get.toNamed(Routes.DETAIL_VOICE_ACTOR,
                                        arguments: detail.voices);
                                  },
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            width: 150.w,
                                            height: 300.h,
                                            // color: Colors.amber,
                                            child: (detail
                                                        .voices![index]
                                                        .person!
                                                        .images
                                                        ?.jpg
                                                        ?.imageUrl !=
                                                    null)
                                                ? Image.network(
                                                    detail
                                                            .voices![index]
                                                            .person!
                                                            .images
                                                            ?.jpg
                                                            ?.imageUrl ??
                                                        'Kosong',
                                                    fit: BoxFit.cover,
                                                  )
                                                : const CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        detail.voices![index].person!.name ??
                                            '-',
                                        style: GoogleFonts.breeSerif(
                                            fontSize: 16.sp),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "(${detail.voices![index].language ?? '-'})",
                                          style: GoogleFonts.breeSerif(
                                              fontSize: 16.sp),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )))
                  ]))
                ],
              );
            }));
  }
}
