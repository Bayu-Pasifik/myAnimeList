import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/top_manga_controller.dart';

class TopMangaView extends GetView<TopMangaController> {
  const TopMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopMangaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TopMangaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
