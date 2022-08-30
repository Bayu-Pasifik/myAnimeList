import 'package:carousel_slider/carousel_slider.dart';
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Airing",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      shadows: const [BoxShadow(blurRadius: 1)]),
                ),
                TextButton(
                    onPressed: () {},
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
            future: controller.topAnime(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return GetBuilder<AnimeTestController>(
                builder: (c) {
                  List<Widget> animetop = [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[0].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[1].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[2].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[3].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[4].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[5].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                          ClipRRect(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[7].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.amber,
                            child: Image.network(
                              "${c.listTopAnime[8].images['jpg'].imageUrl}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.amber,
                              child: Image.network(
                                "${c.listTopAnime[9].images['jpg'].imageUrl}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.blue,
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
                                  alignment: Alignment.bottomLeft,
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
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Currently Airing",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    shadows: const [BoxShadow(blurRadius: 1)]),
              ),
              TextButton(
                  onPressed: () {},
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
            future: controller.currentlyAiring(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GetBuilder<AnimeTestController>(
                builder: (c) {
                  return Container(
                      child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.5,
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                    ),
                    items: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[0].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[1].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[2].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[3].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[4].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[5].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[6].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[7].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[8].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                              child: SizedBox(
                                width: MediaQuery.of(context).size.height,
                                child: Image.network(
                                  "${c.listAiringAnime[9].images['jpg'].imageUrl}",
                                  fit: BoxFit.cover,
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
                  ));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
