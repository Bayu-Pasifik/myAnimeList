import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
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
          future: controller.getCharacter(character.character?.malId ?? 0),
          builder: (context, snapshot) {
            // if (snapshot.data == null) {
            //   return const Center(
            //     child: Text("No data"),
            //   );
            // }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Stack(
              children: [
                (snapshot.data?.anime?[0].anime?.images?['jpg']
                            ?.largeImageUrl !=
                        null)
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.amber,
                        child: Image.network(
                          "${snapshot.data?.anime?[0].anime?.images?['jpg']?.largeImageUrl}",
                          fit: BoxFit.cover,
                        ),
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
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 100,
                  child: ClipRRect(
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(10),
                    //     topRight: Radius.circular(10)),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        width: 150,
                        height: 200,
                        color: Colors.red,
                        child: Image.network(
                          "${snapshot.data!.images!.jpg!.imageUrl}",
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                    child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    // width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    width: 200,
                    height: 200,
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text("${snapshot.data!.name}"),
                    ),
                    // color: Colors.amber,
                  ),
                )),
                Positioned(
                    child: Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,

                    width: 200,
                    height: 200,
                    // color: Colors.amber,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 35),
                        child: Text("${snapshot.data!.nameKanji}")),
                    // color: Colors.amber,
                  ),
                )),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    // color: Colors.amber,
                    child: ListView(
                      padding: EdgeInsets.only(left: 10),
                      children: [
                        ExpandablePanel(
                          header: const Text(
                            "Synopsis",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                shadows: [BoxShadow(blurRadius: 0.5)]),
                          ),
                          collapsed: Text(
                            "${snapshot.data?.about}",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          expanded: Text(
                            "${snapshot.data?.about}",
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
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
