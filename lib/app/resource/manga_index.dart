import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/modules/Home_Manga/controllers/home_manga_controller.dart';
import 'package:my_anime_list/app/resource/indexManga/indexA.dart';
import 'package:my_anime_list/app/resource/indexManga/indexB.dart';
import 'package:my_anime_list/app/resource/indexManga/indexC.dart';
import 'package:my_anime_list/app/resource/indexManga/indexD.dart';
import 'package:my_anime_list/app/resource/indexManga/indexE.dart';
import 'package:my_anime_list/app/resource/indexManga/indexF.dart';
import 'package:my_anime_list/app/resource/indexManga/indexG.dart';
import 'package:my_anime_list/app/resource/indexManga/indexH.dart';
import 'package:my_anime_list/app/resource/indexManga/indexI.dart';
import 'package:my_anime_list/app/resource/indexManga/indexJ.dart';
import 'package:my_anime_list/app/resource/indexManga/indexK.dart';
import 'package:my_anime_list/app/resource/indexManga/indexL.dart';
import 'package:my_anime_list/app/resource/indexManga/indexM.dart';
import 'package:my_anime_list/app/resource/indexManga/indexN.dart';
import 'package:my_anime_list/app/resource/indexManga/indexO.dart';
import 'package:my_anime_list/app/resource/indexManga/indexP.dart';
import 'package:my_anime_list/app/resource/indexManga/indexQ.dart';
import 'package:my_anime_list/app/resource/indexManga/indexR.dart';
import 'package:my_anime_list/app/resource/indexManga/indexS.dart';
import 'package:my_anime_list/app/resource/indexManga/indexT.dart';
import 'package:my_anime_list/app/resource/indexManga/indexU.dart';
import 'package:my_anime_list/app/resource/indexManga/indexV.dart';
import 'package:my_anime_list/app/resource/indexManga/indexW.dart';
import 'package:my_anime_list/app/resource/indexManga/indexX.dart';
import 'package:my_anime_list/app/resource/indexManga/indexY.dart';
import 'package:my_anime_list/app/resource/indexManga/indexZ.dart';


class MangaIndex extends StatelessWidget {
  const MangaIndex({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeMangaController>();

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
         mangaByIndexA(controller),
         mangaByIndexB(controller),
         mangaByIndexC(controller),
         mangaByIndexD(controller),
         mangaByIndexE(controller),
         mangaByIndexF(controller),
         mangaByIndexG(controller),
         mangaByIndexH(controller),
         mangaByIndexI(controller),
         mangaByIndexJ(controller),
         mangaByIndexK(controller),
         mangaByIndexL(controller),
         mangaByIndexM(controller),
         mangaByIndexN(controller),
         mangaByIndexO(controller),
         mangaByIndexP(controller),
         mangaByIndexQ(controller),
         mangaByIndexR(controller),
         mangaByIndexS(controller),
         mangaByIndexT(controller),
         mangaByIndexU(controller),
         mangaByIndexV(controller),
         mangaByIndexW(controller),
         mangaByIndexX(controller),
         mangaByIndexY(controller),
         mangaByIndexZ(controller),
        ]));
  }
}
