import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_anime_list/app/data/model/manga/manga_model.dart' as manga;
import 'package:my_anime_list/app/modules/utils.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';
import '../controllers/detail_manga_controller.dart';
import 'package:my_anime_list/app/data/model/character_model.dart' as char;

class DetailMangaView extends GetView<DetailMangaController> {
  const DetailMangaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final manga.Manga mangas = Get.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 10.h,
          elevation: 0,
          stretch: true,
          pinned: true,
          centerTitle: true,
          title: Text('${mangas.title}'),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
           SizedBox(
            height: 5.h,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                mangas.images?['jpg']?.imageUrl ?? 'kosong',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(height: 20.h),
          ExpandablePanel(
            theme: ExpandableThemeData(
              iconColor:  isDarkmode.isTrue || getDarkmode
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 0, 0, 0),
            ),
            collapsed: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Text("You can view more information about this comics here",
                      style: GoogleFonts.kurale(
                        fontWeight: FontWeight.w500,
                        color:  isDarkmode.isTrue || getDarkmode
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
                  color:  isDarkmode.isTrue || getDarkmode
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
                        (mangas.title != "")
                            ? "${mangas.title}"
                            : "${mangas.titleEnglish}",
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
                        (mangas.titleJapanese != "")
                            ? "${mangas.titleJapanese}"
                            : "${mangas.title}",
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
                        (mangas.rank != 0) ? "${mangas.rank}" : "-",
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
                        (mangas.scored != 0)
                            ? "${mangas.scored}"
                            : "${mangas.score}",
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
                        (mangas.scoredBy != 0)
                            ? "${mangas.scoredBy} Peoples"
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
                      child: (mangas.genres != [])
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: mangas.genres!
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
                      child: (mangas.published != null)
                          ? Text(
                              (mangas.status!),
                              style: GoogleFonts.kurale(),
                            )
                          : const Text("-"),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Released on",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (mangas.published!.from!.isNotEmpty)
                          ? Text(
                              controller.formatDate(mangas.published!.from!),
                              style: GoogleFonts.kurale(),
                            )
                          : const Text("-"),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Released to",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (mangas.published!.to != null)
                          ? Text(
                              controller.formatDate(mangas.published!.to!),
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
                        "Chapter",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (mangas.chapters != null)
                          ? Text(
                              "${mangas.chapters} Chapter",
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
                        "Volume",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (mangas.volumes != null)
                          ? Text(
                              "${mangas.volumes} Volumes",
                              style: GoogleFonts.kurale(),
                            )
                          : Text("-", style: GoogleFonts.kurale()),
                    )
                  ]),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Author",
                          style: GoogleFonts.squadaOne(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: (mangas.authors!.isNotEmpty)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: mangas.authors!.map((item) {
                                  return Text(
                                    item.name!,
                                    style: GoogleFonts.kurale(),
                                  );
                                }).toList(),
                              )
                            : const Text("-"),
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
                      child: (mangas.themes!.isNotEmpty)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: mangas.themes!
                                  .map((item) => Text(item.name!,
                                      style: GoogleFonts.kurale()))
                                  .toList())
                          : const Text("-"),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Publisher",
                        style: GoogleFonts.squadaOne(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: (mangas.serializations!.isNotEmpty)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: mangas.serializations!
                                  .map((item) => Text(
                                        "${item.name}",
                                        style: GoogleFonts.kurale(),
                                      ))
                                  .toList())
                          : Text(
                              "-",
                              style: GoogleFonts.kurale(),
                            ),
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
                  iconColor:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.black),
              header: Text(
                "Synopsis",
                style: GoogleFonts.squadaOne(color: Colors.blue, fontSize: 20),
              ),
              collapsed: Text(
                mangas.synopsis != null
                    ? "${mangas.synopsis}"
                    : "No Synopsis Yet",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.kurale(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              expanded: Text(
                mangas.synopsis != null
                    ? "${mangas.synopsis}"
                    : "No Synopsis Yet",
                softWrap: true,
                style: GoogleFonts.kurale(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ! character
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 10),
            child: Text(
              "Character",
              style: GoogleFonts.squadaOne(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            // color: Colors.red,
            child: FutureBuilder<List<char.Character>?>(
              future: controller.getCharacterManga(mangas.malId!),
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
                        color:  isDarkmode.isTrue || getDarkmode
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 5,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listCharacterManga?.length ?? 0,
                  itemBuilder: (context, index) {
                    char.Character character =
                        controller.listCharacterManga![index];
                    return GestureDetector(
                      onTap: () {
                        // print(character.character!.malId);
                        Get.toNamed(Routes.MANGA_CHARACTER,
                            arguments: character.character);
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 150,
                                height: 300,
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
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            character.character?.name ?? '-',
                            style: GoogleFonts.breeSerif(fontSize: 16),
                          ),
                          Expanded(
                            child: Text(
                              "(${character.role ?? '-'})",
                              style: GoogleFonts.breeSerif(fontSize: 16),
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
