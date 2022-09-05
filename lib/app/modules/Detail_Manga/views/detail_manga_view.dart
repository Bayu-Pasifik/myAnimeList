import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_manga_controller.dart';

class DetailMangaView extends GetView<DetailMangaController> {
  const DetailMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailMangaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailMangaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
