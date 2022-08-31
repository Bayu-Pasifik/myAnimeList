import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/top_anime_controller.dart';

class TopAnimeView extends GetView<TopAnimeController> {
  const TopAnimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopAnimeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TopAnimeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
