import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/modules/home/controllers/home_controller.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexA.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexE.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexF.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexG.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexH.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexI.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexJ.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexK.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexL.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexM.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexN.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexO.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexP.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexQ.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexR.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexS.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexT.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexU.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexV.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexW.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexX.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexY.dart';
import 'package:my_anime_list/app/resource/indexAnime/indexZ.dart';
import 'indexAnime/indexB.dart';
import 'indexAnime/indexC.dart';
import 'indexAnime/indexD.dart';

class AnimeIndex extends StatelessWidget {
  const AnimeIndex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

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
        body: TabBarView(children: [
          animeByIndexA(controller),
          animeByIndexB(controller),
          animeByIndexC(controller),
          animeByIndexD(controller),
          animeByIndexE(controller),
          animeByIndexF(controller),
          animeByIndexG(controller),
          animeByIndexH(controller),
          animeByIndexI(controller),
          animeByIndexJ(controller),
          animeByIndexK(controller),
          animeByIndexL(controller),
          animeByIndexM(controller),
          animeByIndexN(controller),
          animeByIndexO(controller),
          animeByIndexP(controller),
          animeByIndexQ(controller),
          animeByIndexR(controller),
          animeByIndexS(controller),
          animeByIndexT(controller),
          animeByIndexU(controller),
          animeByIndexV(controller),
          animeByIndexW(controller),
          animeByIndexX(controller),
          animeByIndexY(controller),
          animeByIndexZ(controller),
        ]));
  }
}
