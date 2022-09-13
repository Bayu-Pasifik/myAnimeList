import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:my_anime_list/app/data/model/detail_anime_character.dart'
    as detail;
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
            panel: FutureBuilder<detail.DetailAnimeCharacter?>(
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
                return ListView(
                  padding: const EdgeInsets.all(10),
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
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
                      height: 10,
                    ),
                    // ! center image
                    (snapshot.data!.images!.jpg!.imageUrl != null)
                        ? UnconstrainedBox(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width: Get.mediaQuery.size.width / 3,
                                height: Get.mediaQuery.size.height / 4,
                                color: Colors.green,
                                child: Image.network(
                                  "${snapshot.data!.images!.jpg!.imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : const CircularProgressIndicator(),
                    const SizedBox(
                      height: 5,
                    ),
                    // ! name and kanji name
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
                      theme: ExpandableThemeData(
                          iconColor:
                              Get.isDarkMode ? Colors.white : Colors.black),
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
                    const SizedBox(
                      height: 40,
                    ),
                    (character.voiceActors!.isNotEmpty)
                        ? Text(
                            "Voice Actors",
                            style: GoogleFonts.squadaOne(
                                color: Colors.blue[400], fontSize: 16),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      itemCount: character.voiceActors!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        char.VoiceActor? voices = character.voiceActors?[index];
                        return ListTile(
                          leading: (voices != null)
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${voices.person!.images!.jpg!.imageUrl}"),
                                )
                              : Text(
                                  "No Data",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                ),
                          title: (voices != null)
                              ? Text(
                                  "${voices.person!.name}",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                )
                              : Text(
                                  "No data",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                ),
                          subtitle: (voices != null)
                              ? Text(
                                  "${voices.language}",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                )
                              : Text(
                                  "No data",
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.breeSerif(
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis)),
                                ),
                          onTap: () => Get.toNamed(Routes.DETAIL_VOICE_ACTOR,
                              arguments: voices),
                        );
                      },
                    )
                  ],
                );
              },
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
                  return (snapshot.data!.anime!.isNotEmpty)
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          // color: Colors.amber,
                          child: ClipRRect(
                            child: Image.network(
                              "${snapshot.data?.anime?[0].anime?.images?['jpg']?.largeImageUrl}",
                              fit: BoxFit.cover,
                            ),
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
                          : const Center(child: CircularProgressIndicator());
                })));
  }
}
