import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: 'Search Anime',
                  border: OutlineInputBorder())),
        ],
      ),
    ));
  }
}
