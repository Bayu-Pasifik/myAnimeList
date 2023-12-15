import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/modules/Home_Manga/controllers/home_manga_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;

class MangaIndexTemplate extends StatelessWidget {
  final String index;

  const MangaIndexTemplate({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeMangaController>();
    return PagedGridView<int, manga.Manga>(
        padding: EdgeInsets.all(10.h),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 1 / 1.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        pagingController: index == 'A'
            ? controller.mangaIndexA
            : index == 'B'
                ? controller.mangaIndexB
                : index == 'C'
                    ? controller.mangaIndexC
                    : index == 'D'
                        ? controller.mangaIndexD
                        : index == 'E'
                            ? controller.mangaIndexE
                            : index == 'F'
                                ? controller.mangaIndexF
                                : index == 'G'
                                    ? controller.mangaIndexG
                                    : index == 'H'
                                        ? controller.mangaIndexH
                                        : index == 'I'
                                            ? controller.mangaIndexI
                                            : index == 'J'
                                                ? controller.mangaIndexJ
                                                : index == 'K'
                                                    ? controller.mangaIndexK
                                                    : index == 'L'
                                                        ? controller.mangaIndexL
                                                        : index == 'M'
                                                            ? controller
                                                                .mangaIndexM
                                                            : index == 'N'
                                                                ? controller
                                                                    .mangaIndexN
                                                                : index == 'O'
                                                                    ? controller
                                                                        .mangaIndexO
                                                                    : index ==
                                                                            'P'
                                                                        ? controller
                                                                            .mangaIndexP
                                                                        : index ==
                                                                                'Q'
                                                                            ? controller.mangaIndexQ
                                                                            : index == 'R'
                                                                                ? controller.mangaIndexR
                                                                                : index == 'S'
                                                                                    ? controller.mangaIndexS
                                                                                    : index == 'T'
                                                                                        ? controller.mangaIndexT
                                                                                        : index == 'U'
                                                                                            ? controller.mangaIndexU
                                                                                            : index == 'V'
                                                                                                ? controller.mangaIndexV
                                                                                                : index == "W"
                                                                                                    ? controller.mangaIndexW
                                                                                                    : index == 'X'
                                                                                                        ? controller.mangaIndexX
                                                                                                        : index == 'Y'
                                                                                                            ? controller.mangaIndexY
                                                                                                            : controller.mangaIndexZ,
        builderDelegate: PagedChildBuilderDelegate<manga.Manga>(
          animateTransitions: true,
          itemBuilder: (context, item, number) {
            // List<manga.Genres>? genres = item.genres;
            return Column(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: GestureDetector(
                      onTap: () =>
                          Get.toNamed(Routes.DETAIL_MANGA, arguments: item),
                      child: (item.genres != null &&
                              number < item.genres!.length &&
                              item.genres![number].name != null &&
                              item.genres![number].name!.contains('Erotica'))
                          ? Image.asset("assets/images/Image_not_available.png")
                          : CachedNetworkImage(
                              imageUrl: "${item.images!['jpg']!.imageUrl}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/Image_not_available.png",
                              ),
                            ),
                    ),
                  ),
                ),
                Text(
                  "${item.title}",
                  style: GoogleFonts.kurale(
                    fontSize: 16.sp,
                    textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
                Text(
                  "(${item.status})",
                  style: GoogleFonts.kurale(
                    fontSize: 16.sp,
                    textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
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
                  style: GoogleFonts.inter(fontSize: 18),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    // style: ElevatedButton.styleFrom(
                    //     backgroundColor: const Color(0XFF54BAB9)),
                    onPressed: () => index == 'A'
                        ? controller.mangaIndexA.retryLastFailedRequest()
                        : index == 'B'
                            ? controller.mangaIndexB.retryLastFailedRequest()
                            : index == 'C'
                                ? controller.mangaIndexC
                                    .retryLastFailedRequest()
                                : index == 'D'
                                    ? controller.mangaIndexD
                                        .retryLastFailedRequest()
                                    : index == 'E'
                                        ? controller.mangaIndexE
                                            .retryLastFailedRequest()
                                        : index == 'F'
                                            ? controller.mangaIndexF
                                                .retryLastFailedRequest()
                                            : index == 'G'
                                                ? controller.mangaIndexG
                                                    .retryLastFailedRequest()
                                                : index == 'H'
                                                    ? controller.mangaIndexH
                                                        .retryLastFailedRequest()
                                                    : index == 'I'
                                                        ? controller.mangaIndexI
                                                            .retryLastFailedRequest()
                                                        : index == 'J'
                                                            ? controller
                                                                .mangaIndexJ
                                                                .retryLastFailedRequest()
                                                            : index == 'K'
                                                                ? controller
                                                                    .mangaIndexK
                                                                    .retryLastFailedRequest()
                                                                : index == 'L'
                                                                    ? controller
                                                                        .mangaIndexL
                                                                        .retryLastFailedRequest()
                                                                    : index ==
                                                                            'M'
                                                                        ? controller
                                                                            .mangaIndexM
                                                                            .retryLastFailedRequest()
                                                                        : index ==
                                                                                'N'
                                                                            ? controller.mangaIndexN.retryLastFailedRequest()
                                                                            : index == 'O'
                                                                                ? controller.mangaIndexO.retryLastFailedRequest()
                                                                                : index == 'P'
                                                                                    ? controller.mangaIndexP.retryLastFailedRequest()
                                                                                    : index == 'Q'
                                                                                        ? controller.mangaIndexQ.retryLastFailedRequest()
                                                                                        : index == 'R'
                                                                                            ? controller.mangaIndexR.retryLastFailedRequest()
                                                                                            : index == 'S'
                                                                                                ? controller.mangaIndexS.retryLastFailedRequest()
                                                                                                : index == 'T'
                                                                                                    ? controller.mangaIndexT.retryLastFailedRequest()
                                                                                                    : index == 'U'
                                                                                                        ? controller.mangaIndexU.retryLastFailedRequest()
                                                                                                        : index == 'V'
                                                                                                            ? controller.mangaIndexV.retryLastFailedRequest()
                                                                                                            : index == "W"
                                                                                                                ? controller.mangaIndexW.retryLastFailedRequest()
                                                                                                                : index == 'X'
                                                                                                                    ? controller.mangaIndexX.retryLastFailedRequest()
                                                                                                                    : index == 'Y'
                                                                                                                        ? controller.mangaIndexY.retryLastFailedRequest()
                                                                                                                        : controller.mangaIndexZ.retryLastFailedRequest(),
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
                style: GoogleFonts.inter(fontSize: 18),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color(0XFF54BAB9)),
                  onPressed: () => index == 'A'
                      ? controller.mangaIndexA.retryLastFailedRequest()
                      : index == 'B'
                          ? controller.mangaIndexB.retryLastFailedRequest()
                          : index == 'C'
                              ? controller.mangaIndexC.retryLastFailedRequest()
                              : index == 'D'
                                  ? controller.mangaIndexD
                                      .retryLastFailedRequest()
                                  : index == 'E'
                                      ? controller.mangaIndexE
                                          .retryLastFailedRequest()
                                      : index == 'F'
                                          ? controller.mangaIndexF
                                              .retryLastFailedRequest()
                                          : index == 'G'
                                              ? controller.mangaIndexG
                                                  .retryLastFailedRequest()
                                              : index == 'H'
                                                  ? controller.mangaIndexH
                                                      .retryLastFailedRequest()
                                                  : index == 'I'
                                                      ? controller.mangaIndexI
                                                          .retryLastFailedRequest()
                                                      : index == 'J'
                                                          ? controller
                                                              .mangaIndexJ
                                                              .retryLastFailedRequest()
                                                          : index == 'K'
                                                              ? controller
                                                                  .mangaIndexK
                                                                  .retryLastFailedRequest()
                                                              : index == 'L'
                                                                  ? controller
                                                                      .mangaIndexL
                                                                      .retryLastFailedRequest()
                                                                  : index == 'M'
                                                                      ? controller
                                                                          .mangaIndexM
                                                                          .retryLastFailedRequest()
                                                                      : index ==
                                                                              'N'
                                                                          ? controller
                                                                              .mangaIndexN
                                                                              .retryLastFailedRequest()
                                                                          : index == 'O'
                                                                              ? controller.mangaIndexO.retryLastFailedRequest()
                                                                              : index == 'P'
                                                                                  ? controller.mangaIndexP.retryLastFailedRequest()
                                                                                  : index == 'Q'
                                                                                      ? controller.mangaIndexQ.retryLastFailedRequest()
                                                                                      : index == 'R'
                                                                                          ? controller.mangaIndexR.retryLastFailedRequest()
                                                                                          : index == 'S'
                                                                                              ? controller.mangaIndexS.retryLastFailedRequest()
                                                                                              : index == 'T'
                                                                                                  ? controller.mangaIndexT.retryLastFailedRequest()
                                                                                                  : index == 'U'
                                                                                                      ? controller.mangaIndexU.retryLastFailedRequest()
                                                                                                      : index == 'V'
                                                                                                          ? controller.mangaIndexV.retryLastFailedRequest()
                                                                                                          : index == "W"
                                                                                                              ? controller.mangaIndexW.retryLastFailedRequest()
                                                                                                              : index == 'X'
                                                                                                                  ? controller.mangaIndexX.retryLastFailedRequest()
                                                                                                                  : index == 'Y'
                                                                                                                      ? controller.mangaIndexY.retryLastFailedRequest()
                                                                                                                      : controller.mangaIndexZ.retryLastFailedRequest(),
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
        ));
  }
}
