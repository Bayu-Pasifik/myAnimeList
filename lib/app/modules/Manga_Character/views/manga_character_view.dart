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
      
      body: const Center(
        child: Text(
          'MangaCharacterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
