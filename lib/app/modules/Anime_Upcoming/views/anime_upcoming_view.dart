import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/anime_upcoming_controller.dart';

class AnimeUpcomingView extends GetView<AnimeUpcomingController> {
  const AnimeUpcomingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimeUpcomingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AnimeUpcomingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
