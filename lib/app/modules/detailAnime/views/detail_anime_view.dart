import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import 'package:my_anime_list/app/resource/video_item.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:my_anime_list/app/routes/app_pages.dart';
import '../controllers/detail_anime_controller.dart';

class DetailAnimeView extends GetView<DetailAnimeController> {
  const DetailAnimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ani.Animes anime = Get.arguments;
    return Scaffold(
        body: Container(
      color: Colors.grey[200],
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            stretch: true,
            pinned: true,
            centerTitle: true,
            title: Text('${anime.title}'),
            flexibleSpace: FlexibleSpaceBar(
              background: VideoItem(
                url: anime.trailer?.youtubeId ?? '',
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            // ! title
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 3),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  anime.title?.toUpperCase() ?? 'null',
                  style: const TextStyle(
                      // backgroundColor: Colors.grey[100],
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      shadows: [BoxShadow(blurRadius: 0.5)]),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ! padding image
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 3),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          anime.images?['jpg']?.imageUrl ?? 'kosong',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // ! padding content beside image
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ! padding score
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow[700],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 2),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "${anime.score ?? '0'} ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 2),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "(${anime.scoredBy ?? '0'}) users",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Ranked # ${anime.rank ?? 'No rank'}",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              anime.type ?? '?',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "(${anime.episodes ?? '?'} Episode)",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Aired"),
                        Row(
                          children: [
                            Text(anime.season ?? '?'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${anime.year ?? '?'}"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Studio"),
                        (anime.studios!.isNotEmpty)
                            ? Text("${anime.studios?[0].name}")
                            : Text("No Information"),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Status"),
                        Text(anime.status ?? 'No information'),
                        const SizedBox(
                          height: 10,
                        ),

                        Text("Genre"),
                        for (var genre in anime.genres!)
                          Text("${genre.name ?? 'No Informnation'} ")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ExpandablePanel(
                header: const Text(
                  "Synopsis",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      shadows: [BoxShadow(blurRadius: 0.5)]),
                ),
                collapsed: Text(
                  "${anime.synopsis}",
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Text(
                  "${anime.synopsis}",
                  softWrap: true,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),
              child: Text(
                "Character",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    shadows: [BoxShadow(blurRadius: 0.5)]),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              // color: Colors.red,
              child: FutureBuilder(
                future: controller.getCharacterAnime(anime.malId ?? 0),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listCharacterAnime?.length ?? 0,
                    itemBuilder: (context, index) {
                      char.Character character =
                          controller.listCharacterAnime![index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.ANIME_CHARACTER,
                              arguments: character);
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: 150,
                                height: 300,
                                // color: Colors.amber,
                                child: (character
                                            .character!.images!.jpg!.imageUrl !=
                                        null)
                                    ? Image.network(
                                        character.character!.images?.jpg
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
                              character.character?.name ?? 'NaN',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                "(${character.role ?? 'NaN'})",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
          ]))
        ],
      ),
    ));
  }
}
