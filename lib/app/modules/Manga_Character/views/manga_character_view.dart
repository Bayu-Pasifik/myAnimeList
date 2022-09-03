import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';

import '../controllers/manga_character_controller.dart';

class MangaCharacterView extends GetView<MangaCharacterController> {
  const MangaCharacterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MangaCharacterView'),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 200,
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.blue[300],
            child: const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Chose Your Destination",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [BoxShadow(blurRadius: 1)],
                        fontSize: 20),
                  ),
                )),
          ),
          ListTile(
            leading: const Icon(Icons.movie_creation_outlined),
            title: const Text("Anime"),
            onTap: () {
              Get.offNamed(Routes.HOME);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Anime Character"),
            onTap: () {
              Get.offNamed(Routes.ANIME_CHARACTER);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: const Text("Manga"),
            onTap: () {
              Get.offNamed(Routes.HOME_MANGA);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Manga Character"),
            onTap: () {
              // Get.offNamed(Routes.MANGA_CHARACTER);
            },
          ),
        ]),
      ),
      body: const Center(
        child: Text(
          'MangaCharacterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
