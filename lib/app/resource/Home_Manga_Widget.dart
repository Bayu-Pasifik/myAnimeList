import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/modules/Home_Manga/controllers/home_manga_controller.dart';
import 'package:my_anime_list/app/modules/utils.dart';
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
                  style: GoogleFonts.squadaOne(
                      color:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.blue[900],
                      fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.TOP_MANGA);
                    },
                    child: Text(
                      "Load More",
                      style: GoogleFonts.squadaOne(
                          color:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.blue[900],
                          fontSize: 18),
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
                                      Get.toNamed(Routes.DETAIL_MANGA,
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
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(6.r)),
                                        width: 60.w,
                                        height: 20.h,
                                        child: Row(
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Icon(
                                                  Icons.star,
                                                  size: 18.h,
                                                  color: Colors.amber[400],
                                                )),
                                            Align(
                                              alignment: Alignment.topLeft,
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
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "${c.listMangaManga[0].title}",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.breeSerif(
                                              fontSize: 20,
                                              textStyle: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis)),
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
                                Get.toNamed(Routes.DETAIL_MANGA,
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
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(6.r)),
                                  width: 60.w,
                                  height: 20.h,
                                  child: Row(
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Icon(
                                            Icons.star,
                                            size: 18.h,
                                            color: Colors.amber[400],
                                          )),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "${c.listMangaManga[1].score}",
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
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "${c.listMangaManga[1].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                                Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[2].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[2].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                                Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[3].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[3].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                                Get.toNamed(Routes.DETAIL_MANGA,
                                    arguments: c.listMangaManga[4]);
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[4].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[4].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                                Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[5].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[5].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                              Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[6].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[6].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                                Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[7].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[7].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                              Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[8].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${c.listMangaManga[8].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                                Get.toNamed(Routes.DETAIL_MANGA,
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
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6.r)),
                                      width: 60.w,
                                      height: 20.h,
                                      child: Row(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Icon(
                                                Icons.star,
                                                size: 18.h,
                                                color: Colors.amber[400],
                                              )),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "${c.listMangaManga[9].score}",
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
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${controller.listMangaManga[9].title}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 20,
                                        textStyle: const TextStyle(
                                            overflow: TextOverflow.ellipsis)),
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
                  "All Manhwa",
                  style: GoogleFonts.squadaOne(
                      color:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.blue[900],
                      fontSize: 18),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.MANHWA_PAGE);
                  },
                  child: Text(
                    "Load More",
                    style: GoogleFonts.squadaOne(
                        color:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.blue[900],
                        fontSize: 18),
                  ))
            ],
          ),
          FutureBuilder<List?>(
            future: controller.manhwa,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.listManhwa.isEmpty) {
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
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[0]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[0].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[0].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[1]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[1].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[1].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[2]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[2].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[2].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[3]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[3].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[3].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[4]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[4].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[4].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[5]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[5].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[5].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[6]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[6].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[6].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[7]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[7].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[7].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[8]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[8].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[8].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhwa[9]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    "${c.listManhwa[9].images['jpg'].imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "${c.listManhwa[9].title}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.breeSerif(
                                    fontSize: 20,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
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
                  "All Manhua",
                  style: GoogleFonts.squadaOne(
                      color:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.blue[900],
                      fontSize: 18),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.MANHUA_PAGE);
                  },
                  child: Text(
                    "Load More",
                    style: GoogleFonts.squadaOne(
                        color:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.blue[900],
                        fontSize: 18),
                  ))
            ],
          ),
          FutureBuilder<List?>(
            future: controller.manhua,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.listManhwa.isEmpty) {
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
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[0]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[0].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[0].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[1]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[1].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[1].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[2]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[2].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[2].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[3]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[3].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[3].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[4]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[4].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[4].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[5]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[5].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[5].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[6]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[6].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[6].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[7]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[7].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[7].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[8]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[8].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[8].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.isPhone
                            ? const EdgeInsets.symmetric(horizontal: 10)
                            : context.isSmallTablet
                                ? const EdgeInsets.symmetric(horizontal: 20)
                                : (context.isLargeTablet)
                                    ? const EdgeInsets.symmetric(horizontal: 30)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 50),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.DETAIL_MANGA,
                                      arguments: c.listManhua[9]);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: (c.listManhua.isNotEmpty)
                                      ? Image.network(
                                          "${c.listManhua[9].images['jpg'].imageUrl}",
                                          fit: BoxFit.cover,
                                        )
                                      : const CircularProgressIndicator(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: (c.listManhua.isNotEmpty)
                                  ? Text(
                                      "${c.listManhua[9].title}",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.breeSerif(
                                          fontSize: 20,
                                          textStyle: const TextStyle(
                                              overflow: TextOverflow.ellipsis)),
                                    )
                                  : const CircularProgressIndicator(),
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
