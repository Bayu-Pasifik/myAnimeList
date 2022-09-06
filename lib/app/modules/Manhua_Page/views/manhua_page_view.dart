import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manhua_page_controller.dart';

class ManhuaPageView extends GetView<ManhuaPageController> {
  const ManhuaPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManhuaPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManhuaPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
