import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as anime;
import 'package:my_anime_list/app/modules/utils.dart';
import 'package:my_anime_list/app/resource/anime_index.dart';
import 'package:my_anime_list/app/resource/home_widget.dart';
import 'package:my_anime_list/app/resource/studios_widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import '../../../data/model/genre_model.dart' as gen;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    // final box = GetStorage();
    // if (box.read("themeDark") == true) {
    //   controller.isDark.value = true;
    // }
    List<Widget> widgets = [
      // ! home page
      const HomeWidget(),
      // Text("home"),
      // ! search page
      SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              // autofocus: c.myFocusNode,
              // focusNode: controller.myFocusNode,
              controller: controller.searchController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: 'Search Anime',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Obx(() => (controller.isSearch.isFalse)
                  ? ElevatedButton(
                      onPressed: (controller.isSearch.isFalse)
                          ? (() {
                              controller.clearSearch();
                              controller.setIsSearching(true);
                              Future.delayed(const Duration(seconds: 3), () {
                                controller.resultQuery(
                                    controller.searchController.text,
                                    controller.animeSearch.firstPageKey);
                                controller.setIsSearching(false);
                              });
                            })
                          : () {},
                      child: const Text("Search"))
                  : const CircularProgressIndicator()),
            ),
            Obx(() => (controller.isSearch.isFalse)
                ? Expanded(
                    child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    // color: Colors.amber,
                    child: PagedGridView<int, anime.Animes>(
                        padding: EdgeInsets.all(10.h),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1 / 1.6,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        pagingController: controller.animeSearch,
                        builderDelegate:
                            PagedChildBuilderDelegate<anime.Animes>(
                          animateTransitions: true,
                          itemBuilder: (context, item, number) {
                            // List<manga.Genres>? genres = item.genres;
                            return Column(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        height: 200.h,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.DETAIL_ANIME,
                                                arguments: item);
                                          },
                                          child: (item.genres != null &&
                                                  number <
                                                      item.genres!.length &&
                                                  item.genres![number].name !=
                                                      null &&
                                                  item.genres![number].name!
                                                      .contains('Erotica'))
                                              ? Image.asset(
                                                  "assets/images/Image_not_available.png")
                                              : CachedNetworkImage(
                                                  imageUrl:
                                                      "${item.images!['jpg']!.imageUrl}",
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.r),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              downloadProgress) =>
                                                          Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Image.asset(
                                                    "assets/images/Image_not_available.png",
                                                  ),
                                                ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(6.r)),
                                            width: 50.w,
                                            height: 20.h,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 18.h,
                                                  color: Colors.yellow,
                                                ),
                                                Text("${item.score}",
                                                    style: GoogleFonts.kurale())
                                              ],
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "${item.title}",
                                  style: GoogleFonts.kurale(
                                    fontSize: 16.sp,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Text(
                                  "(${item.status})",
                                  style: GoogleFonts.kurale(
                                    fontSize: 16.sp,
                                    textStyle: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            );
                          },
                          firstPageErrorIndicatorBuilder: (_) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "There is an error",
                                  style: GoogleFonts.kurale(fontSize: 18.sp),
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  width: 100.w,
                                  height: 50.h,
                                  child: ElevatedButton(
                                    // style: ElevatedButton.styleFrom(
                                    //     backgroundColor: const Color(0XFF54BAB9)),
                                    onPressed: () {
                                      return controller.animeSearch
                                          .retryLastFailedRequest();
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.restart_alt),
                                        Text("Retry"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ));
                          },
                          newPageErrorIndicatorBuilder: (context) => Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "There is an error",
                                style: GoogleFonts.kurale(fontSize: 18.sp),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: 100.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: (() => controller.animeSearch
                                      .retryLastFailedRequest()),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.restart_alt),
                                      Text("Retry"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                          firstPageProgressIndicatorBuilder: (context) =>
                              Center(
                            child: LoadingAnimationWidget.hexagonDots(
                                color: const Color.fromARGB(255, 20, 106, 254),
                                size: 50),
                          ),
                          transitionDuration: const Duration(seconds: 3),
                          newPageProgressIndicatorBuilder: (context) => Center(
                            child: LoadingAnimationWidget.hexagonDots(
                                color: const Color.fromARGB(255, 20, 106, 254),
                                size: 50),
                          ),
                          noItemsFoundIndicatorBuilder: (_) {
                            return const Center(
                              child: Text('No data found'),
                            );
                          },
                          noMoreItemsIndicatorBuilder: (_) {
                            return Center(
                              child: Text(
                                'No more data found',
                                style: GoogleFonts.kurale(),
                              ),
                            );
                          },
                        )),
                  ))
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Please wait",
                            style: GoogleFonts.poppins(fontSize: 14)),
                        const SizedBox(height: 10),
                        LoadingAnimationWidget.hexagonDots(
                            color: const Color.fromARGB(255, 20, 106, 254),
                            size: 50),
                      ],
                    ),
                  ))
          ],
        ),
      )),
      // ! index page
      const DefaultTabController(length: 26, child: AnimeIndex()),

      // ! Genre page
      FutureBuilder<List<gen.Genre>?>(
        future: controller.genreList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          return ListView.separated(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              gen.Genre genre = controller.listGenreAnime[index];
              return ListTile(
                leading: CircleAvatar(
                    backgroundColor: isDarkmode.isTrue || getDarkmode
                        ? Colors.white
                        : Colors.grey[900],
                    child: Center(
                      child: Text("${index + 1}"),
                    )),
                title: Text(
                  "${genre.name}",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.breeSerif(
                      textStyle:
                          const TextStyle(overflow: TextOverflow.ellipsis)),
                ),
                onTap: () {
                  Get.toNamed(Routes.GENRE_ANIME_RESULT, arguments: genre);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 2,
              );
            },
          );
        },
      ),

      // ! Season Page
      SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // ! dropdown tahun
            DropdownSearch<String>(
              popupProps: const PopupProps.dialog(
                  showSelectedItems: true,
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                      keyboardType: TextInputType.numberWithOptions())),
              asyncItems: (String filter) async {
                Uri url = Uri.parse('https://api.jikan.moe/v4/seasons');
                var res = await http.get(url);
                List<String> allYear = [];
                var data =
                    (json.decode(res.body) as Map<String, dynamic>)['data'];
                data!.forEach(((element) {
                  allYear.add(element['year'].toString());
                }));

                return allYear;
              },
              onChanged: (yearValue) {
                controller.year.value = int.parse(yearValue!);
                // controller.listSeasonAnime.clear();
                // controller.pageSeason.clear();
                // controller.seasonRefresh.resetNoData();
              },
              selectedItem: controller.year.value.toString(),
            ),
            SizedBox(
              height: 10.h,
            ),
            // ! dropdown musim
            DropdownSearch<String>(
              popupProps: const PopupProps.dialog(showSelectedItems: true),
              items: const ["WINTER", "SPRING", "SUMMER", "FALL"],
              onChanged: (seasonValue) {
                controller.season.value = seasonValue!;
                controller.listSeasonAnime.clear();
                controller.pageSeason.clear();
                // controller.seasonRefresh.resetNoData();
              },
              selectedItem: controller.season.value,
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Obx(() => (controller.isSeasonSearch.isFalse)
                  ? ElevatedButton(
                      onPressed: (controller.isSeasonSearch.isFalse)
                          ? (() {
                              controller.clearSeason();
                              controller.setIsSearchingSeason(true);
                              Future.delayed(const Duration(seconds: 3), () {
                                controller.resultQuery(
                                    controller.searchController.text,
                                    controller.animeSearch.firstPageKey);
                                controller.setIsSearchingSeason(false);
                              });
                            })
                          : () {},
                      child: const Text("Search"))
                  : const CircularProgressIndicator()),
            ),
            Obx(() => (controller.isSeasonSearch.isFalse)
                ? Expanded(
                    child: PagedGridView<int, anime.Animes>(
                        padding: EdgeInsets.all(10.h),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1 / 1.6,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        pagingController: controller.animeSeason,
                        builderDelegate:
                            PagedChildBuilderDelegate<anime.Animes>(
                          animateTransitions: true,
                          itemBuilder: (context, item, number) {
                            if (controller.animeSeason.itemList!.isNotEmpty) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          height: 200.h,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.DETAIL_ANIME,
                                                  arguments: item);
                                            },
                                            child: (item.genres != null &&
                                                    number <
                                                        item.genres!.length &&
                                                    item.genres![number].name !=
                                                        null &&
                                                    item.genres![number].name!
                                                        .contains('Erotica'))
                                                ? Image.asset(
                                                    "assets/images/Image_not_available.png")
                                                : CachedNetworkImage(
                                                    imageUrl:
                                                        "${item.images!['jpg']!.imageUrl}",
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.r),
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            Center(
                                                      child: CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      "assets/images/Image_not_available.png",
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.r)),
                                              width: 50.w,
                                              height: 20.h,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 18.h,
                                                    color: Colors.yellow,
                                                  ),
                                                  Text("${item.score}",
                                                      style:
                                                          GoogleFonts.kurale())
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${item.title}",
                                    style: GoogleFonts.kurale(
                                      fontSize: 16.sp,
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                  Text(
                                    "(${item.status})",
                                    style: GoogleFonts.kurale(
                                      fontSize: 16.sp,
                                      textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                child: Lottie.asset(
                                    'assets/lottie/kesalahan.json'),
                              );
                            }
                          },
                          firstPageErrorIndicatorBuilder: (_) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "There is an error",
                                  style: GoogleFonts.kurale(fontSize: 18.sp),
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  width: 100.w,
                                  height: 50.h,
                                  child: ElevatedButton(
                                    // style: ElevatedButton.styleFrom(
                                    //     backgroundColor: const Color(0XFF54BAB9)),
                                    onPressed: () {
                                      return controller.animeSeason
                                          .retryLastFailedRequest();
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.restart_alt),
                                        Text("Retry"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ));
                          },
                          newPageErrorIndicatorBuilder: (context) => Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${controller.animeSeason.error}",
                                style: GoogleFonts.kurale(fontSize: 18.sp),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: 100.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: (() => controller.animeSeason
                                      .retryLastFailedRequest()),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.restart_alt),
                                      Text("Retry"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                          firstPageProgressIndicatorBuilder: (context) {
                            if (controller.animeSeason.itemList == null) {
                              return Center(
                                  child: DelayedDisplay(
                                delay: const Duration(seconds: 5),
                                child: Lottie.asset(
                                    'assets/lottie/kesalahan.json'),
                              ));
                            }
                            return Center(
                              child: LoadingAnimationWidget.hexagonDots(
                                  color:
                                      const Color.fromARGB(255, 20, 106, 254),
                                  size: 50),
                              // child: Center(
                              //     child: Text("${controller.animeSeason.error}")),
                            );
                          },
                          transitionDuration: const Duration(seconds: 3),
                          newPageProgressIndicatorBuilder: (context) => Center(
                            child: LoadingAnimationWidget.hexagonDots(
                                color: const Color.fromARGB(255, 20, 106, 254),
                                size: 50),
                            // child: Center(
                            //     child: Text("${controller.animeSeason.error}")),
                          ),
                          noItemsFoundIndicatorBuilder: (_) {
                            return Center(
                              child: Text(
                                'No data found',
                                style: GoogleFonts.kurale(fontSize: 18.sp),
                              ),
                            );
                          },
                          noMoreItemsIndicatorBuilder: (_) {
                            return Center(
                              child: Text(
                                "${controller.animeSeason.error}",
                                style: GoogleFonts.kurale(),
                              ),
                            );
                          },
                        )))
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Please wait",
                            style: GoogleFonts.poppins(fontSize: 14)),
                        const SizedBox(height: 10),
                        LoadingAnimationWidget.hexagonDots(
                            color: const Color.fromARGB(255, 20, 106, 254),
                            size: 50),
                      ],
                    ),
                  )),
          ],
        ),
      )),

      // ! Studios Page
      const AnimeStudios()
    ];
    return Obx(() => WillPopScope(
          onWillPop: () async {
            DateTime now = DateTime.now();

            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime!) >
                    const Duration(seconds: 5)) {
              currentBackPressTime = now;
              Get.snackbar("Info", "Press back button again to exit",
                  shouldIconPulse: true,
                  duration: const Duration(milliseconds: 1000),
                  icon: const Icon(Icons.warning),
                  snackPosition: SnackPosition.BOTTOM,
                  instantInit: true,
                  barBlur: 1000);

              return false;
            }
            return true;
          },
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: isDarkmode.isTrue || getDarkmode
                    ? Colors.grey[900]
                    : Colors.blue[900],
                actions: [
                  IconButton(onPressed: () {
                    controller.changeTheme(!isDarkmode.value);
                  }, icon: Obx(() {
                    return isDarkmode.isTrue || getDarkmode
                        ? const Icon(Icons.sunny)
                        : const Icon(Icons.mode_night_outlined);
                  }))
                ],
              ),
              drawer: Drawer(
                elevation: 200,
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.blue[300],
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text("Chose Your Destination",
                              style: GoogleFonts.breeSerif(fontSize: 20)),
                        )),
                  ),
                  ListTile(
                    leading: const Icon(Icons.movie_creation_outlined),
                    title: Text(
                      "Anime",
                      style: GoogleFonts.breeSerif(fontSize: 16),
                    ),
                    onTap: () {
                      // Get.offNamed(Routes.HOME_PAGE);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(Icons.book_outlined),
                    title: Text(
                      "Manga",
                      style: GoogleFonts.breeSerif(fontSize: 16),
                    ),
                    onTap: () {
                      Get.offNamed(Routes.HOME_MANGA);
                    },
                  ),
                ]),
              ),
              body: GetBuilder<HomeController>(
                  builder: (c) => widgets[c.selectIndex.value]),
              bottomNavigationBar: Obx(
                () => ConvexAppBar(
                    items: const [
                      TabItem(icon: Icons.home, title: 'Home'),
                      TabItem(icon: Icons.search, title: 'search'),
                      TabItem(icon: Icons.bookmarks_outlined, title: 'index'),
                      TabItem(
                          icon: Icons.movie_filter_outlined, title: 'Genres'),
                      TabItem(icon: Icons.cloudy_snowing, title: 'Season'),
                      TabItem(icon: Icons.business, title: 'Studios'),
                    ],
                    backgroundColor: isDarkmode.isTrue || getDarkmode
                        ? Colors.grey[900]
                        : Colors.blue[900],
                    initialActiveIndex: controller.selectIndex.value,
                    style: TabStyle.textIn, //optional, default as 0
                    onTap: (index) {
                      if (controller.selectIndex.value != 1) {
                        controller.clearSearch();
                        controller.searchController.clear();
                      }
                      controller.chagePage(index);
                      debugPrint("index: $index");
                      debugPrint("controller index: ${controller.selectIndex}");
                    }),
              )),
        ));
  }
}
