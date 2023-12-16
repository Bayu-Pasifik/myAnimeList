import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/anime_models.dart' as ani;
import 'package:my_anime_list/app/modules/utils.dart';
import 'package:my_anime_list/app/resource/video_item.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;
import 'package:my_anime_list/app/routes/app_pages.dart';
import '../controllers/detail_anime_controller.dart';

class DetailAnimeView extends GetView<DetailAnimeController> {
  const DetailAnimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ani.Animes anime = Get.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.h,
          stretch: true,
          pinned: true,
          centerTitle: true,
          elevation: 0,
          title: Text('${anime.title}'),
          flexibleSpace: FlexibleSpaceBar(
            background: VideoItem(
              url: anime.trailer?.youtubeId ?? '',
            ),
          ),
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
                imageUrl: "${anime.images!['jpg']!.imageUrl}",
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
                  Text("You can view more information about this comics here",
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
                "About comics",
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
                        "Original Title",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.title != "")
                            ? "${anime.title}"
                            : "${anime.titleEnglish}",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Japanese / Korean / Chinese Title",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.titleJapanese != "")
                            ? "${anime.titleJapanese}"
                            : "${anime.title}",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Type",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.type != "") ? "${anime.type}" : "-",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Source",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.source != "") ? "${anime.source}" : "-",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Episodes",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (anime.episodes != null)
                          ? Text(
                              "${anime.episodes} Episodes",
                              style: GoogleFonts.kurale(),
                            )
                          : Text(
                              "-",
                              style: GoogleFonts.kurale(),
                            ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Status",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (anime.status != "")
                          ? Text(
                              "${anime.status}",
                              style: GoogleFonts.kurale(),
                            )
                          : Text(
                              "-",
                              style: GoogleFonts.kurale(),
                            ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Duration",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.duration != "") ? "${anime.duration}" : "-",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Broadcast",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.broadcast?.string != "")
                            ? "${anime.broadcast?.string}"
                            : "-",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Season",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.season != "") || (anime.year != 0)
                            ? "${anime.season} ${anime.year}"
                            : "-",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Rank",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.rank != 0) ? "${anime.rank}" : "-",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Score",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.score != 0) ? "${anime.score}" : "0",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Scored By",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        (anime.scoredBy != 0)
                            ? "${anime.scoredBy} Peoples"
                            : "0 Peoples",
                        style: GoogleFonts.kurale(),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Genres",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: (anime.genres != [])
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: anime.genres!
                                  .map((item) => Text(
                                        "${item.name}",
                                        style: GoogleFonts.kurale(),
                                      ))
                                  .toList())
                          : const Text("-"),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Status",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (anime.aired != null)
                          ? Text(
                              (anime.status!),
                              style: GoogleFonts.kurale(),
                            )
                          : const Text("-"),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Aired on",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (anime.aired!.from! != "0")
                          ? Text(
                              controller.formatDate(anime.aired!.from!),
                              style: GoogleFonts.kurale(),
                            )
                          : const Text("-"),
                    )
                  ]),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Aired to",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          (anime.aired!.to != "0")
                              ? controller.formatDate(anime.aired!.to!)
                              : "-",
                          style: GoogleFonts.kurale(),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Genres",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: (anime.genres!.isNotEmpty)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: anime.genres!.map((item) {
                                  return Text(
                                    item.name!,
                                    style: GoogleFonts.kurale(),
                                  );
                                }).toList(),
                              )
                            : Text(
                                "-",
                                style: GoogleFonts.kurale(),
                              ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Studios",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: (anime.studios!.isNotEmpty)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: anime.studios!.map((item) {
                                  return Text(
                                    item.name!,
                                    style: GoogleFonts.kurale(),
                                  );
                                }).toList(),
                              )
                            : Text(
                                "-",
                                style: GoogleFonts.kurale(),
                              ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Producers",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: (anime.producers!.isNotEmpty)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: anime.producers!.map((item) {
                                  return Text(
                                    item.name!,
                                    style: GoogleFonts.kurale(),
                                  );
                                }).toList(),
                              )
                            : Text(
                                "-",
                                style: GoogleFonts.kurale(),
                              ),
                      ),
                    ],
                  ),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Themes",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: (anime.themes!.isNotEmpty)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: anime.themes!
                                  .map((item) => Text(item.name!,
                                      style: GoogleFonts.kurale()))
                                  .toList())
                          : const Text("-"),
                    )
                  ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: isDarkmode.isTrue || getDarkmode
                      ? Colors.white
                      : Colors.black),
              header: Text(
                "Synopsis",
                style:
                    GoogleFonts.squadaOne(color: Colors.blue, fontSize: 20.sp),
              ),
              collapsed: Text(
                anime.synopsis != null
                    ? "${anime.synopsis}"
                    : "No Synopsis Yet",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.kurale(
                    fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
              expanded: Text(
                anime.synopsis != null
                    ? "${anime.synopsis}"
                    : "No Synopsis Yet",
                softWrap: true,
                style: GoogleFonts.kurale(
                    fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: isDarkmode.isTrue || getDarkmode
                      ? Colors.white
                      : Colors.black),
              header: Text(
                "Background",
                style:
                    GoogleFonts.squadaOne(color: Colors.blue, fontSize: 20.sp),
              ),
              collapsed: Text(
                anime.background != ""
                    ? "${anime.background}"
                    : "No background Yet",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.kurale(
                    fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
              expanded: Text(
                anime.background != ""
                    ? "${anime.background}"
                    : "No Background Yet",
                softWrap: true,
                style: GoogleFonts.kurale(
                    fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          // ! character
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              "Character",
              style: GoogleFonts.squadaOne(
                color: Colors.blue,
                fontSize: 20.sp,
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            // color: Colors.red,
            child: FutureBuilder<List<char.Character>?>(
              future: controller.getCharacterAnime(anime.malId!),
              builder: (context, snapshot) {
                // print(snapshot.data!.isEmpty);

                if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      "No Data",
                      style: GoogleFonts.kurale(
                        fontSize: 18.sp,
                        color: isDarkmode.isTrue || getDarkmode
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 5.w,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listCharacterAnime?.length ?? 0,
                  itemBuilder: (context, index) {
                    char.Character character =
                        controller.listCharacterAnime![index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.ANIME_CHARACTER,
                            arguments: character.character);
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150.w,
                                height: 300.h,
                                // color: Colors.amber,
                                child: (character
                                            .character!.images!.jpg!.imageUrl !=
                                        null)
                                    ? Image.network(
                                        character.character!.images?.jpg
                                                ?.imageUrl ??
                                            'Kosong',
                                        fit: BoxFit.cover,
                                      )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            character.character?.name ?? '-',
                            style: GoogleFonts.breeSerif(fontSize: 16.sp),
                          ),
                          Expanded(
                            child: Text(
                              "(${character.role ?? '-'})",
                              style: GoogleFonts.breeSerif(fontSize: 16.sp),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ]))
      ],
    ));
  }
}
