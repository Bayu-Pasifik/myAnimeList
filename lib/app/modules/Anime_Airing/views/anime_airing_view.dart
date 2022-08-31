import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/anime_airing_controller.dart';

class AnimeAiringView extends GetView<AnimeAiringController> {
  const AnimeAiringView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimeAiringView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AnimeAiringView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
