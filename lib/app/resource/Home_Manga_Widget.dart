import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_anime_list/app/modules/Home_Manga/controllers/home_manga_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';

class HomeMangaWidget extends StatelessWidget {
  const HomeMangaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeMangaController>();
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Manga",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      shadows: const [BoxShadow(blurRadius: 1)]),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.TOP_ANIME);
                    },
                    child: Text(
                      "Load More",
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          shadows: const [BoxShadow(blurRadius: 1)]),
                    ))
              ],
            ),
          ),
          FutureBuilder<List?>(
            future: controller.mangaTop,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.listMangaManga.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GetBuilder<HomeMangaController>(
                builder: (c) {
                  List<Widget> animetop = [
                    (c.listMangaManga.isNotEmpty)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_ANIME,
                                          arguments: c.listMangaManga[0]);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.amber,
                                      child: Image.network(
                                        "${c.listMangaManga[0].images['jpg'].imageUrl}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber[400],
                                            )),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "${c.listMangaManga[0].score}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                shadows: [
                                                  BoxShadow(blurRadius: 1)
                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "${c.listMangaManga[0].title}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : const Text("Waiting..."),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listMangaManga[1]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listMangaManga[1].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[1].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "${c.listMangaManga[1].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listMangaManga[2]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listMangaManga[2].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[2].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[2].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listMangaManga[3]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listMangaManga[3].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[3].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[3].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listMangaManga[4]);
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listMangaManga[4]);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.amber,
                                  child: Image.network(
                                    "${c.listMangaManga[4].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[4].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[4].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listMangaManga[5]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listMangaManga[5].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[5].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[5].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_ANIME,
                                  arguments: c.listMangaManga[6]);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listMangaManga[6].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[6].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[6].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listMangaManga[7]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listMangaManga[7].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[7].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[7].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_ANIME,
                                  arguments: c.listMangaManga[8]);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listMangaManga[8].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${c.listMangaManga[8].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[8].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listMangaManga[9]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listMangaManga[9].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.amber[400],
                                      )),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "${controller.listMangaManga[9].score}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${controller.listMangaManga[9].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        shadows: [BoxShadow(blurRadius: 1)]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ];
                  return Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          items: animetop,
                          carouselController: c.carouselController,
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                c.currentSlider.value = index;
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: animetop.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () =>
                                  c.carouselController.animateToPage(entry.key),
                              child: Obx(
                                () {
                                  return Container(
                                    width: 8,
                                    height: 8,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.black)
                                            .withOpacity(
                                                c.currentSlider.value ==
                                                        entry.key
                                                    ? 0.9
                                                    : 0.4)),
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ]);
                },
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Recommended Manga",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      shadows: const [BoxShadow(blurRadius: 1)]),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.ANIME_AIRING);
                  },
                  child: Text(
                    "Load More",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        shadows: const [BoxShadow(blurRadius: 1)]),
                  ))
            ],
          ),
          FutureBuilder<List?>(
            future: controller.mangareq,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.listReqManga.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GetBuilder<HomeMangaController>(
                builder: (c) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.5,
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: true,
                    ),
                    items: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[0]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[0].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[0].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[1]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[1].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[1].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[2]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[2].entry[1].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[2].entry[1].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[3]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[3].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[3].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[4]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[4].entry[1].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[4].entry[1].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[5]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[5].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[5].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[6]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[6].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[6].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[7]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[7].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[7].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[8]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[8].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[8].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listReqManga[9]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listReqManga[9].entry[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listReqManga[9].entry[0].title}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [BoxShadow(blurRadius: 1)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
