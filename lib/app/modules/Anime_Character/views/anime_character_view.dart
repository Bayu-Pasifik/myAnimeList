import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:my_anime_list/app/data/model/detail_anime_character.dart'
    as detail;
import '../controllers/anime_character_controller.dart';

class AnimeCharacterView extends GetView<AnimeCharacterController> {
  const AnimeCharacterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final ani.Animes anime = Get.arguments['anime'];
    final char.Character character = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('${character.character!.name}'),
          centerTitle: true,
          // backgroundColor: Colors.transparent,
        ),
        body: FutureBuilder<detail.DetailAnimeCharacter?>(
          future: controller.getCharacter(character.character!.malId!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return Stack(
              children: [
                (snapshot.data!.anime!.isNotEmpty)
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        // color: Colors.amber,
                        child: Image.network(
                          "${snapshot.data?.anime?[0].anime?.images?['jpg']?.largeImageUrl}",
                          fit: BoxFit.cover,
                        )

                        // child: ,
                        )
                    : (snapshot.data!.manga!.isNotEmpty)
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            // color: Colors.amber,
                            child: Image.network(
                              snapshot.data?.manga?[0].manga?.images?['jpg']
                                      ?.largeImageUrl ??
                                  'NAN',
                              fit: BoxFit.cover,
                            )
                            // child: ,
                            )
                        : const Center(child: CircularProgressIndicator()),
                Positioned(
                  top: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: (Get.isDarkMode)
                          ? Colors.grey[600]
                          : Colors.grey[200],
                    ),
                  ),
                ),
                // ! center image
                Positioned(
                  top: Get.mediaQuery.size.height / 6,
                  left: Get.mediaQuery.size.width / 3.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: 150,
                        height: 200,
                        // color: Colors.red,
                        child: (snapshot.data!.images!.jpg!.imageUrl != null)
                            ? Image.network(
                                "${snapshot.data!.images!.jpg!.imageUrl}",
                                fit: BoxFit.cover,
                              )
                            : const CircularProgressIndicator()),
                  ),
                ),

                // ! widget for name and description
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.48,
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    // color: Colors.amber,
                    child: ListView(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      children: [
                        Center(
                            child: Text(
                          textAlign: TextAlign.center,
                          "${snapshot.data!.name}",
                          style: GoogleFonts.breeSerif(fontSize: 16),
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                            child: Text(
                          textAlign: TextAlign.center,
                          "( ${snapshot.data!.nameKanji} )",
                          style: GoogleFonts.notoSans(fontSize: 16),
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                        )),
                        const SizedBox(
                          height: 40,
                        ),
                        ExpandablePanel(
                          header: Text(
                            "Description",
                            style: GoogleFonts.squadaOne(
                                fontSize: 16, color: Colors.blue[400]),
                          ),
                          collapsed: Text(
                            "${snapshot.data?.about}",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.kurale(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          expanded: Text(
                            "${snapshot.data?.about}",
                            style: GoogleFonts.kurale(
                                fontSize: 16, fontWeight: FontWeight.normal),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
