import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:my_anime_list/app/modules/home/controllers/home_controller.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart' as studio;

class AnimeStudios extends StatelessWidget {
  const AnimeStudios({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return PagedGridView<int, studio.Studios>(
        padding: EdgeInsets.all(10.h),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        pagingController: controller.studioAnime,
        builderDelegate: PagedChildBuilderDelegate<studio.Studios>(
          animateTransitions: true,
          itemBuilder: (context, item, number) {
            if (controller.studioAnime.itemList!.isNotEmpty) {
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
                              Get.toNamed(Routes.DETAIL_STUDIOS,
                                  arguments: item);
                            },
                            child: CachedNetworkImage(
                              imageUrl: "${item.images!.jpg!.imageUrl}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
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
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 6, vertical: 2),
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius:
                        //               BorderRadius.circular(
                        //                   6.r)),
                        //       width: 50.w,
                        //       height: 20.h,
                        //       child: Row(
                        //         children: [
                        //           Icon(
                        //             Icons.star,
                        //             size: 18.h,
                        //             color: Colors.yellow,
                        //           ),
                        //           Text("${item.score}",
                        //               style:
                        //                   GoogleFonts.kurale())
                        //         ],
                        //       )),
                        // )
                      ],
                    ),
                  ),
                  Text(
                    "${item.titles![0].title}",
                    style: GoogleFonts.kurale(
                      fontSize: 16.sp,
                      textStyle:
                          const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    "(${item.count} Animes) ",
                    style: GoogleFonts.kurale(
                      fontSize: 16.sp,
                      textStyle:
                          const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Lottie.asset('assets/lottie/kesalahan.json'),
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
                      return controller.studioAnime.retryLastFailedRequest();
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
                "${controller.studioAnime.error}",
                style: GoogleFonts.kurale(fontSize: 18.sp),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 100.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: (() =>
                      controller.studioAnime.retryLastFailedRequest()),
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
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                  color: const Color.fromARGB(255, 20, 106, 254), size: 50),
              // child: Center(
              //     child: Text("${controller.studioAnime.error}")),
            );
          },
          transitionDuration: const Duration(seconds: 3),
          newPageProgressIndicatorBuilder: (context) => Center(
            child: LoadingAnimationWidget.hexagonDots(
                color: const Color.fromARGB(255, 20, 106, 254), size: 50),
            // child: Center(
            //     child: Text("${controller.studioAnime.error}")),
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
                "${controller.studioAnime.error}",
                style: GoogleFonts.kurale(),
              ),
            );
          },
        ));
  }
}
