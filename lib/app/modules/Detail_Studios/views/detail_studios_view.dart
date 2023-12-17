import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_anime_list/app/data/model/studios_model.dart' as studio;
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import 'package:my_anime_list/app/modules/utils.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import '../controllers/detail_studios_controller.dart';

class DetailStudiosView extends GetView<DetailStudiosController> {
  const DetailStudiosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    studio.Studios studios = Get.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 10,
          elevation: 0,
          stretch: true,
          pinned: true,
          centerTitle: true,
          title: Text('${studios.titles![0].title}'),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: SizedBox(
              height: 280.h,
              width: 180.w,
              child: CachedNetworkImage(
                imageUrl: "${studios.images!.jpg!.imageUrl}",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/Image_not_available.png"),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(height: 20.h),
          ExpandablePanel(
            theme: ExpandableThemeData(
              iconColor: isDarkmode.isTrue || getDarkmode
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 0, 0, 0),
            ),
            collapsed: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Text("You can view more information about this studio here",
                      style: GoogleFonts.kurale(
                        fontWeight: FontWeight.w500,
                        color: isDarkmode.isTrue || getDarkmode
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0),
                      )),
            ),
            header: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "About Studio",
                style:
                    GoogleFonts.squadaOne(color: Colors.blue, fontSize: 20.sp),
              ),
            ),
            expanded: Padding(
                padding: const EdgeInsets.all(5),
                child: Table(
                  border: TableBorder.all(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: isDarkmode.isTrue || getDarkmode
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromARGB(15, 37, 37, 37),
                  ),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Original Name",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          (studios.titles![0].title != "")
                              ? "${studios.titles![0].title}"
                              : "-",
                          style: GoogleFonts.kurale(),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Japanese Name",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          (studios.titles![1].title != "")
                              ? "${studios.titles![1].title}"
                              : "-",
                          style: GoogleFonts.kurale(),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Anime Created",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          (studios.count != 0)
                              ? "${studios.count} Animes"
                              : "-",
                          style: GoogleFonts.kurale(),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Established At",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          (studios.established != "")
                              ? controller.formatDate(studios.established)
                              : "-",
                          style: GoogleFonts.kurale(),
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Favored By",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          (studios.favorites != 0)
                              ? "${studios.favorites} Peoples"
                              : "0 People",
                          style: GoogleFonts.kurale(),
                        ),
                      )
                    ]),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: isDarkmode.isTrue || getDarkmode
                      ? Colors.white
                      : Colors.black),
              header: Text(
                "Background Story",
                style: GoogleFonts.squadaOne(color: Colors.blue, fontSize: 20.sp),
              ),
              collapsed: Text(
                studios.about != ""
                    ? "${studios.about}"
                    : "No Background Story",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.kurale(
                    fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
              expanded: Text(
                studios.about != ""
                    ? "${studios.about}"
                    : "No Background Story",
                softWrap: true,
                style: GoogleFonts.kurale(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Anime Created",
                  style:
                      GoogleFonts.squadaOne(color: Colors.blue, fontSize: 20.sp),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.DETAIL_ANIME_STUDIO, arguments: studios);
                  },
                  child: Text(
                    "Load More",
                    style:
                        GoogleFonts.squadaOne(color: Colors.blue, fontSize: 20.sp),
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  // color: Colors.red,
                  child: PagedListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    pagingController: controller.animeByStudio,
                    builderDelegate: PagedChildBuilderDelegate<ani.Animes>(
                        itemBuilder: (context, item, index) => Column(
                              children: [
                                Container(
                                  width: 150.w,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${item.images?['jpg']?.imageUrl}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
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
                                            "assets/images/Image_not_available.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 150.w,
                                  height: 60.h,
                                  // color: Colors.amber,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${item.title}",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.kurale(),
                                      ),
                                      Text("${item.status}",
                                          style: GoogleFonts.kurale())
                                    ],
                                  ),
                                )
                              ],
                            )),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                  )))
        ]))
      ],
    ));
  }
}
