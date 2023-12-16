import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/modules/home/controllers/home_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as anime;

class AnimeIndexTemplate extends StatelessWidget {
  final String index;

  const AnimeIndexTemplate({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return AnimationLimiter(
      child: PagedGridView<int, anime.Animes>(
          padding: EdgeInsets.all(10.h),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1 / 1.6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          pagingController: index == 'A'
              ? controller.animeIndexA
              : index == 'B'
                  ? controller.animeIndexB
                  : index == 'C'
                      ? controller.animeIndexC
                      : index == 'D'
                          ? controller.animeIndexD
                          : index == 'E'
                              ? controller.animeIndexE
                              : index == 'F'
                                  ? controller.animeIndexF
                                  : index == 'G'
                                      ? controller.animeIndexG
                                      : index == 'H'
                                          ? controller.animeIndexH
                                          : index == 'I'
                                              ? controller.animeIndexI
                                              : index == 'J'
                                                  ? controller.animeIndexJ
                                                  : index == 'K'
                                                      ? controller.animeIndexK
                                                      : index == 'L'
                                                          ? controller
                                                              .animeIndexL
                                                          : index == 'M'
                                                              ? controller
                                                                  .animeIndexM
                                                              : index == 'N'
                                                                  ? controller
                                                                      .animeIndexN
                                                                  : index == 'O'
                                                                      ? controller
                                                                          .animeIndexO
                                                                      : index ==
                                                                              'P'
                                                                          ? controller
                                                                              .animeIndexP
                                                                          : index == 'Q'
                                                                              ? controller.animeIndexQ
                                                                              : index == 'R'
                                                                                  ? controller.animeIndexR
                                                                                  : index == 'S'
                                                                                      ? controller.animeIndexS
                                                                                      : index == 'T'
                                                                                          ? controller.animeIndexT
                                                                                          : index == 'U'
                                                                                              ? controller.animeIndexU
                                                                                              : index == 'V'
                                                                                                  ? controller.animeIndexV
                                                                                                  : index == "W"
                                                                                                      ? controller.animeIndexW
                                                                                                      : index == 'X'
                                                                                                          ? controller.animeIndexX
                                                                                                          : index == 'Y'
                                                                                                              ? controller.animeIndexY
                                                                                                              : controller.animeIndexZ,
          builderDelegate: PagedChildBuilderDelegate<anime.Animes>(
            animateTransitions: false,
            itemBuilder: (context, item, number) {
              // List<manga.Genres>? genres = item.genres;
              return AnimationConfiguration.staggeredGrid(
                position: number,
                columnCount: number,
                duration: const Duration(seconds: 1),
                delay: const Duration(seconds: 1),
                child: SlideAnimation(
                  horizontalOffset: 50,
                  duration: const Duration(seconds: 1),
                  delay: const Duration(seconds: 1),
                  child: FadeInAnimation(
                    duration: const Duration(seconds: 1),
                    delay: const Duration(seconds: 1),
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 200.w,
                            height: 200.h,
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.DETAIL_ANIME,
                              preventDuplicates: true,
                                  arguments: item),
                              child: (item.genres != null &&
                                      number < item.genres!.length &&
                                      item.genres![number].name != null &&
                                      item.genres![number].name!
                                          .contains('Erotica'))
                                  ? Image.asset(
                                      "assets/images/Image_not_available.png")
                                  : Stack(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              "${item.images!['jpg']!.imageUrl}",
                                          imageBuilder:
                                              (context, imageProvider) =>
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
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            "assets/images/Image_not_available.png",
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
                    ),
                  ),
                ),
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
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(
                      //     backgroundColor: const Color(0XFF54BAB9)),
                      onPressed: () => index == 'A'
                          ? controller.animeIndexA.retryLastFailedRequest()
                          : index == 'B'
                              ? controller.animeIndexB.retryLastFailedRequest()
                              : index == 'C'
                                  ? controller.animeIndexC
                                      .retryLastFailedRequest()
                                  : index == 'D'
                                      ? controller.animeIndexD
                                          .retryLastFailedRequest()
                                      : index == 'E'
                                          ? controller.animeIndexE
                                              .retryLastFailedRequest()
                                          : index == 'F'
                                              ? controller.animeIndexF
                                                  .retryLastFailedRequest()
                                              : index == 'G'
                                                  ? controller.animeIndexG
                                                      .retryLastFailedRequest()
                                                  : index == 'H'
                                                      ? controller.animeIndexH
                                                          .retryLastFailedRequest()
                                                      : index == 'I'
                                                          ? controller
                                                              .animeIndexI
                                                              .retryLastFailedRequest()
                                                          : index == 'J'
                                                              ? controller
                                                                  .animeIndexJ
                                                                  .retryLastFailedRequest()
                                                              : index == 'K'
                                                                  ? controller
                                                                      .animeIndexK
                                                                      .retryLastFailedRequest()
                                                                  : index == 'L'
                                                                      ? controller
                                                                          .animeIndexL
                                                                          .retryLastFailedRequest()
                                                                      : index ==
                                                                              'M'
                                                                          ? controller
                                                                              .animeIndexM
                                                                              .retryLastFailedRequest()
                                                                          : index == 'N'
                                                                              ? controller.animeIndexN.retryLastFailedRequest()
                                                                              : index == 'O'
                                                                                  ? controller.animeIndexO.retryLastFailedRequest()
                                                                                  : index == 'P'
                                                                                      ? controller.animeIndexP.retryLastFailedRequest()
                                                                                      : index == 'Q'
                                                                                          ? controller.animeIndexQ.retryLastFailedRequest()
                                                                                          : index == 'R'
                                                                                              ? controller.animeIndexR.retryLastFailedRequest()
                                                                                              : index == 'S'
                                                                                                  ? controller.animeIndexS.retryLastFailedRequest()
                                                                                                  : index == 'T'
                                                                                                      ? controller.animeIndexT.retryLastFailedRequest()
                                                                                                      : index == 'U'
                                                                                                          ? controller.animeIndexU.retryLastFailedRequest()
                                                                                                          : index == 'V'
                                                                                                              ? controller.animeIndexV.retryLastFailedRequest()
                                                                                                              : index == "W"
                                                                                                                  ? controller.animeIndexW.retryLastFailedRequest()
                                                                                                                  : index == 'X'
                                                                                                                      ? controller.animeIndexX.retryLastFailedRequest()
                                                                                                                      : index == 'Y'
                                                                                                                          ? controller.animeIndexY.retryLastFailedRequest()
                                                                                                                          : controller.animeIndexZ.retryLastFailedRequest(),
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
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //     backgroundColor: const Color(0XFF54BAB9)),
                    onPressed: () => index == 'A'
                        ? controller.animeIndexA.retryLastFailedRequest()
                        : index == 'B'
                            ? controller.animeIndexB.retryLastFailedRequest()
                            : index == 'C'
                                ? controller.animeIndexC
                                    .retryLastFailedRequest()
                                : index == 'D'
                                    ? controller.animeIndexD
                                        .retryLastFailedRequest()
                                    : index == 'E'
                                        ? controller.animeIndexE
                                            .retryLastFailedRequest()
                                        : index == 'F'
                                            ? controller.animeIndexF
                                                .retryLastFailedRequest()
                                            : index == 'G'
                                                ? controller.animeIndexG
                                                    .retryLastFailedRequest()
                                                : index == 'H'
                                                    ? controller.animeIndexH
                                                        .retryLastFailedRequest()
                                                    : index == 'I'
                                                        ? controller.animeIndexI
                                                            .retryLastFailedRequest()
                                                        : index == 'J'
                                                            ? controller
                                                                .animeIndexJ
                                                                .retryLastFailedRequest()
                                                            : index == 'K'
                                                                ? controller
                                                                    .animeIndexK
                                                                    .retryLastFailedRequest()
                                                                : index == 'L'
                                                                    ? controller
                                                                        .animeIndexL
                                                                        .retryLastFailedRequest()
                                                                    : index ==
                                                                            'M'
                                                                        ? controller
                                                                            .animeIndexM
                                                                            .retryLastFailedRequest()
                                                                        : index ==
                                                                                'N'
                                                                            ? controller.animeIndexN.retryLastFailedRequest()
                                                                            : index == 'O'
                                                                                ? controller.animeIndexO.retryLastFailedRequest()
                                                                                : index == 'P'
                                                                                    ? controller.animeIndexP.retryLastFailedRequest()
                                                                                    : index == 'Q'
                                                                                        ? controller.animeIndexQ.retryLastFailedRequest()
                                                                                        : index == 'R'
                                                                                            ? controller.animeIndexR.retryLastFailedRequest()
                                                                                            : index == 'S'
                                                                                                ? controller.animeIndexS.retryLastFailedRequest()
                                                                                                : index == 'T'
                                                                                                    ? controller.animeIndexT.retryLastFailedRequest()
                                                                                                    : index == 'U'
                                                                                                        ? controller.animeIndexU.retryLastFailedRequest()
                                                                                                        : index == 'V'
                                                                                                            ? controller.animeIndexV.retryLastFailedRequest()
                                                                                                            : index == "W"
                                                                                                                ? controller.animeIndexW.retryLastFailedRequest()
                                                                                                                : index == 'X'
                                                                                                                    ? controller.animeIndexX.retryLastFailedRequest()
                                                                                                                    : index == 'Y'
                                                                                                                        ? controller.animeIndexY.retryLastFailedRequest()
                                                                                                                        : controller.animeIndexZ.retryLastFailedRequest(),
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
          )),
    );
  }
}
