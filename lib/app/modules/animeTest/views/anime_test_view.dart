import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as anim;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../controllers/anime_test_controller.dart';

class AnimeTestView extends GetView<AnimeTestController> {
  const AnimeTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimeTestView'),
          centerTitle: true,
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(tabs: [
                  Tab(
                    text: "A",
                  ),
                  Tab(
                    text: "B",
                  ),
                ]),
                Expanded(
                  child: TabBarView(children: [
                    GetBuilder<AnimeTestController>(
                      builder: (c) {
                        return SmartRefresher(
                            controller: c.refreshControllerA,
                            enablePullUp: true,
                            enablePullDown: true,
                            onRefresh: () => c.refreshDataA(),
                            onLoading: () => c.loadDataA(),
                            child: GridView.builder(
                              itemCount: c.animeListA.length,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) {
                                anim.Animes animes = c.animeListA[index];
                                debugPrint(c.animeListA.length.toString());
                                return Container(
                                    height: 200,
                                    width: 200,
                                    color: Colors.amber,
                                    child: Image.network(
                                      "${animes.images?["jpg"]?.imageUrl}??'kosong'",
                                      fit: BoxFit.cover,
                                    ));
                              },
                            ));
                      },
                      //   );
                      // },
                    ),
                    GetBuilder<AnimeTestController>(
                      builder: (c) {
                        return SmartRefresher(
                            controller: c.refreshControllerB,
                            enablePullUp: true,
                            enablePullDown: true,
                            onRefresh: () => c.refreshDataB(),
                            onLoading: () => c.loadDataB(),
                            child: GridView.builder(
                              itemCount: c.animeListB.length,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                              itemBuilder: (context, index) {
                                anim.Animes animes = c.animeListB[index];
                                debugPrint(c.animeListB.length.toString());
                                return Container(
                                    height: 200,
                                    width: 200,
                                    color: Colors.amber,
                                    child: Image.network(
                                      "${animes.images?["jpg"]?.imageUrl}'kosong'",
                                      fit: BoxFit.cover,
                                    ));
                              },
                            ));
                      },
                      //   );
                      // },
                    )
                  ]),
                ),
              ],
            )));
  }
}
