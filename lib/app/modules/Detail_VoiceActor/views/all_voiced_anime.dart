import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_anime_list/app/modules/Detail_VoiceActor/controllers/detail_voice_actor_controller.dart';
import 'package:my_anime_list/app/data/model/detail_voiceActor_model.dart'
    as va;

class AllVoicedAnime extends GetView<DetailVoiceActorController> {
  const AllVoicedAnime({super.key});

  @override
  Widget build(BuildContext context) {
    va.DetailVoiceActor detail = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Voiced By ${detail.name}"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: AnimationLimiter(
            child: GridView.builder(
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1 / 1.6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20 // spacing between columns
              ),
          itemCount: detail.voices?.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: index,
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
                          child: CachedNetworkImage(
                            imageUrl:
                                "${detail.voices?[index].character?.images?.jpg?.imageUrl}",
                            imageBuilder: (context, imageProvider) => Container(
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
                      Text(
                        "${detail.voices?[index].character?.name}",
                        style: GoogleFonts.kurale(
                          fontSize: 16.sp,
                          textStyle:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Text(
                        "(${detail.voices?[index].role})"
                            .replaceAll("Role.", "")
                            .toLowerCase(),
                        style: GoogleFonts.kurale(
                          fontSize: 16.sp,
                          textStyle:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
