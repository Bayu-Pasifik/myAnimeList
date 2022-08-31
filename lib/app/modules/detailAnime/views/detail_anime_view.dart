import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import 'package:my_anime_list/app/resource/video_item.dart';

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
            Container(
              width: double.infinity,
              // height: 200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ! padding image
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 3),
                    child: Container(
                        // color: Colors.red,
                        // width: 200,
                        height: 200,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              anime.images?['jpg']?.imageUrl ?? 'kosong',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                  ),
                  Padding(
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
                        Text("Aired"),
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
                        Text(anime.studios![0].name ?? '?'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Status"),
                        Text(anime.status ?? 'No Status'),
                      ],
                    ),
                  ),
                ],
              ),
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
            )
          ]))
        ],
      ),
    ));
  }
}
