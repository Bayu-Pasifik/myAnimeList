import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/modules/home/controllers/home_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Airing",
                  style: GoogleFonts.squadaOne(color: Colors.blue[900]),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.TOP_ANIME);
                    },
                    child: Text(
                      "Load More",
                      style: GoogleFonts.squadaOne(color: Colors.blue[900]),
                    ))
              ],
            ),
          ),
          FutureBuilder<List?>(
            future: controller.animeTop,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                controller.topAnime();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.listTopAnime.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GetBuilder<HomeController>(
                builder: (c) {
                  List<Widget> animetop = [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_ANIME,
                                    arguments: c.listTopAnime[0]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[0].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[0].score}",
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
                                    "${c.listTopAnime[0].title}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
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
                                    arguments: c.listTopAnime[1]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[1].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[1].score}",
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
                                    "${c.listTopAnime[1].title}",
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
                                    arguments: c.listTopAnime[2]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[2].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[2].score}",
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
                                    "${c.listTopAnime[2].title}",
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
                                    arguments: c.listTopAnime[3]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[3].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[3].score}",
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
                                    "${c.listTopAnime[3].title}",
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
                                    arguments: c.listTopAnime[4]);
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_ANIME,
                                      arguments: c.listTopAnime[4]);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.amber,
                                  child: Image.network(
                                    "${c.listTopAnime[4].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[4].score}",
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
                                    "${c.listTopAnime[4].title}",
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
                                    arguments: c.listTopAnime[5]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[5].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[5].score}",
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
                                    "${c.listTopAnime[5].title}",
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
                                  arguments: c.listTopAnime[6]);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[6].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[6].score}",
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
                                    "${c.listTopAnime[6].title}",
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
                                    arguments: c.listTopAnime[7]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[7].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[7].score}",
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
                                    "${c.listTopAnime[7].title}",
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
                                  arguments: c.listTopAnime[8]);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[8].images['jpg'].imageUrl}",
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
                                      "${c.listTopAnime[8].score}",
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
                                    "${c.listTopAnime[8].title}",
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
                                    arguments: c.listTopAnime[9]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.amber,
                                child: Image.network(
                                  "${c.listTopAnime[9].images['jpg'].imageUrl}",
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
                                      "${controller.listTopAnime[9].score}",
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
                                    "${controller.listTopAnime[9].title}",
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
                  "Currently Airing",
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
            future: controller.animeAiring,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GetBuilder<HomeController>(
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
                                      arguments: c.listAiringAnime[0]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[0].title}",
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
                                      arguments: c.listAiringAnime[1]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[1].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[1].title}",
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
                                      arguments: c.listAiringAnime[2]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[2].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[2].title}",
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
                                      arguments: c.listAiringAnime[3]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[3].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[3].title}",
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
                                      arguments: c.listAiringAnime[4]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[4].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[4].title}",
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
                                      arguments: c.listAiringAnime[5]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[5].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[5].title}",
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
                                      arguments: c.listAiringAnime[6]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[6].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[6].title}",
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
                                      arguments: c.listAiringAnime[7]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[7].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[7].title}",
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
                                      arguments: c.listAiringAnime[8]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[8].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[8].title}",
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
                                      arguments: c.listAiringAnime[9]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: Image.network(
                                    "${c.listAiringAnime[9].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listAiringAnime[9].title}",
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
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Upcoming Anime",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      shadows: const [BoxShadow(blurRadius: 1)]),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.ANIME_UPCOMING);
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
            future: controller.animeUpcoming,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.listUpcoming.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GetBuilder<HomeController>(
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
                                      arguments: c.listUpcoming[0]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: (c.listTopAnime.isNotEmpty)
                                      ? Image.network(
                                          "${c.listUpcoming[0].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listTopAnime.isNotEmpty)
                                  ? Text(
                                      "${c.listUpcoming[0].title}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          shadows: [BoxShadow(blurRadius: 1)]),
                                    )
                                  : const Text("Kosong"),
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
                                      arguments: c.listUpcoming[1]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: (c.listUpcoming.isNotEmpty)
                                      ? Image.network(
                                          "${c.listUpcoming[1].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[1].title}"
                                    : "Kosong",
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
                                      arguments: c.listUpcoming[2]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.height,
                                  child: (c.listUpcoming.isNotEmpty)
                                      ? Image.network(
                                          "${c.listUpcoming[2].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[2].title}"
                                    : "Kosong",
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
                                      arguments: c.listUpcoming[3]);
                                },
                                child: (c.listUpcoming.isNotEmpty)
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          "${c.listUpcoming[3].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[3].title}"
                                    : "....",
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
                                      arguments: c.listUpcoming[4]);
                                },
                                child: (c.listUpcoming.isNotEmpty)
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          "${c.listUpcoming[4].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[4].title}"
                                    : "....",
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
                                      arguments: c.listUpcoming[5]);
                                },
                                child: (c.listUpcoming.isNotEmpty)
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          "${c.listUpcoming[5].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[5].title}"
                                    : "....",
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
                                      arguments: c.listUpcoming[6]);
                                },
                                child: (c.listUpcoming.isNotEmpty)
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          "${c.listUpcoming[6].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[6].title}"
                                    : "....",
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
                                      arguments: c.listUpcoming[7]);
                                },
                                child: (c.listUpcoming.isNotEmpty)
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          "${c.listUpcoming[7].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[7].title}"
                                    : "....",
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
                                      arguments: c.listUpcoming[8]);
                                },
                                child: (c.listUpcoming.isNotEmpty)
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          "${c.listUpcoming[8].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[8].title}"
                                    : "....",
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
                                      arguments: c.listUpcoming[9]);
                                },
                                child: (c.listUpcoming.isNotEmpty)
                                    ? SizedBox(
                                        width:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          "${c.listUpcoming[9].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                (c.listUpcoming.isNotEmpty)
                                    ? "${c.listUpcoming[9].title}"
                                    : ".....",
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
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
