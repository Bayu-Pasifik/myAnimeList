import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import '../controllers/top_manga_controller.dart';

class TopMangaView extends GetView<TopMangaController> {
  const TopMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Top Manga',
            textAlign: TextAlign.center,
            style: GoogleFonts.breeSerif(
                textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
          ),
          centerTitle: true,
        ),
        body: PagedGridView<int, manga.Manga>(
            padding: EdgeInsets.all(10.h),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 1 / 1.6,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            pagingController: controller.topMangaController,
            builderDelegate: PagedChildBuilderDelegate<manga.Manga>(
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
                                Get.toNamed(Routes.DETAIL_MANGA,
                                    arguments: item);
                              },
                              child: (item.genres != null &&
                                      number < item.genres!.length &&
                                      item.genres![number].name != null &&
                                      item.genres![number].name!
                                          .contains('Erotica'))
                                  ? Image.asset(
                                      "assets/images/Image_not_available.png")
                                  : CachedNetworkImage(
                                      imageUrl:
                                          "${item.images!['jpg']!.imageUrl}",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                      errorWidget: (context, url, error) =>
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
                                    borderRadius: BorderRadius.circular(6.r)),
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
                        textStyle:
                            const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      "(${item.status})",
                      style: GoogleFonts.kurale(
                        fontSize: 16.sp,
                        textStyle:
                            const TextStyle(overflow: TextOverflow.ellipsis),
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
                      style: GoogleFonts.inter(fontSize: 18.sp),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100.w,
                      height: 50.h,
                      child: ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        //     backgroundColor: const Color(0XFF54BAB9)),
                        onPressed: () {
                          return controller.topMangaController
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
                    style: GoogleFonts.inter(fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 100.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: (() => controller.topMangaController
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
              firstPageProgressIndicatorBuilder: (context) => Center(
                child: LoadingAnimationWidget.hexagonDots(
                    color: const Color.fromARGB(255, 84, 154, 186), size: 50),
              ),
              transitionDuration: const Duration(seconds: 3),
              newPageProgressIndicatorBuilder: (context) => Center(
                child: LoadingAnimationWidget.hexagonDots(
                    color: const Color.fromARGB(255, 84, 154, 186), size: 50),
              ),
              noItemsFoundIndicatorBuilder: (_) {
                return const Center(
                  child: Text('No data found'),
                );
              },
              noMoreItemsIndicatorBuilder: (_) {
                return const Center(
                  child: Text('No data found'),
                );
              },
            )));
  }
}
