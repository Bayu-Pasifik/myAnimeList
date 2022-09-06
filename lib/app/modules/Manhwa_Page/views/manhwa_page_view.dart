import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manhwa_page_controller.dart';

class ManhwaPageView extends GetView<ManhwaPageController> {
  const ManhwaPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManhwaPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManhwaPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
