import 'package:flutter/material.dart';
import 'package:my_anime_list/app/modules/template/template_anime_index.dart';

class AnimeIndex extends StatelessWidget {
  const AnimeIndex({Key? key}) : super(key: key);
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
          AnimeIndexTemplate(index: 'A'),
          AnimeIndexTemplate(index: 'B'),
          AnimeIndexTemplate(index: 'C'),
          AnimeIndexTemplate(index: 'D'),
          AnimeIndexTemplate(index: 'E'),
          AnimeIndexTemplate(index: 'F'),
          AnimeIndexTemplate(index: 'G'),
          AnimeIndexTemplate(index: 'H'),
          AnimeIndexTemplate(index: 'I'),
          AnimeIndexTemplate(index: 'J'),
          AnimeIndexTemplate(index: 'K'),
          AnimeIndexTemplate(index: 'L'),
          AnimeIndexTemplate(index: 'M'),
          AnimeIndexTemplate(index: 'N'),
          AnimeIndexTemplate(index: 'O'),
          AnimeIndexTemplate(index: 'P'),
          AnimeIndexTemplate(index: 'Q'),
          AnimeIndexTemplate(index: 'R'),
          AnimeIndexTemplate(index: 'S'),
          AnimeIndexTemplate(index: 'T'),
          AnimeIndexTemplate(index: 'U'),
          AnimeIndexTemplate(index: 'V'),
          AnimeIndexTemplate(index: 'W'),
          AnimeIndexTemplate(index: 'X'),
          AnimeIndexTemplate(index: 'Y'),
          AnimeIndexTemplate(index: 'Z'),
        ]));
  }
}
