import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/modules/Home_Manga/controllers/home_manga_controller.dart';
import 'package:my_anime_list/app/modules/template/template_manga_index.dart';

class MangaIndex extends StatelessWidget {
  const MangaIndex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.amber,
              labelColor: Colors.black.withOpacity(0.4),
              tabs: const [
                Tab(text: 'A'),
                Tab(text: 'B'),
                Tab(text: 'C'),
                Tab(text: 'D'),
                Tab(text: 'E'),
                Tab(text: 'F'),
                Tab(text: 'G'),
                Tab(text: 'H'),
                Tab(text: 'I'),
                Tab(text: 'J'),
                Tab(text: 'K'),
                Tab(text: 'L'),
                Tab(text: 'M'),
                Tab(text: 'N'),
                Tab(text: 'O'),
                Tab(text: 'P'),
                Tab(text: 'Q'),
                Tab(text: 'R'),
                Tab(text: 'S'),
                Tab(text: 'T'),
                Tab(text: 'U'),
                Tab(text: 'V'),
                Tab(text: 'W'),
                Tab(text: 'X'),
                Tab(text: 'Y'),
                Tab(text: 'Z'),
              ]),
        ),
        body: const TabBarView(children: [
          MangaIndexTemplate(index: 'A'),
          MangaIndexTemplate(index: 'B'),
          MangaIndexTemplate(index: 'C'),
          MangaIndexTemplate(index: 'D'),
          MangaIndexTemplate(index: 'E'),
          MangaIndexTemplate(index: 'F'),
          MangaIndexTemplate(index: 'G'),
          MangaIndexTemplate(index: 'H'),
          MangaIndexTemplate(index: 'I'),
          MangaIndexTemplate(index: 'J'),
          MangaIndexTemplate(index: 'K'),
          MangaIndexTemplate(index: 'L'),
          MangaIndexTemplate(index: 'M'),
          MangaIndexTemplate(index: 'N'),
          MangaIndexTemplate(index: 'O'),
          MangaIndexTemplate(index: 'P'),
          MangaIndexTemplate(index: 'Q'),
          MangaIndexTemplate(index: 'R'),
          MangaIndexTemplate(index: 'S'),
          MangaIndexTemplate(index: 'T'),
          MangaIndexTemplate(index: 'U'),
          MangaIndexTemplate(index: 'V'),
          MangaIndexTemplate(index: 'W'),
          MangaIndexTemplate(index: 'X'),
          MangaIndexTemplate(index: 'Y'),
          MangaIndexTemplate(index: 'Z'),
        ]));
  }
}
