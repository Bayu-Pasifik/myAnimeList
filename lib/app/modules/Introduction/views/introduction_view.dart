import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:my_anime_list/app/modules/utils.dart';
import 'package:my_anime_list/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      onDone: () {
        Get.offNamed(Routes.HOME);
      },
      showDoneButton: true,
      showNextButton: true,
      next: Text(
        "Next",
        style: GoogleFonts.kurale(),
      ),
      done: Text(
        "Done",
        style: GoogleFonts.kurale(),
      ),
      isProgress: true,
      safeAreaList: const [true,true,true,true,true,true,true],
      // isTopSafeArea: true,
      showBackButton: true,
      back: Text(
        "Back",
        style: GoogleFonts.kurale(),
      ),
      dotsDecorator: DotsDecorator(
          color:  isDarkmode.isTrue || getDarkmode ? Colors.white : Colors.black,
          activeColor:  isDarkmode.isTrue || getDarkmode ? Colors.blue : Colors.blue),
      dotsFlex: 2,
      pages: [
        PageViewModel(
            title: "Read detailed information about anime and manga",
            body:
                "Here you can read detailed information about anime and manga",
            image: Center(child: Lottie.asset("assets/lottie/reading.json")),
            decoration: PageDecoration(
                bodyTextStyle: GoogleFonts.kurale(fontSize: 18),
                titleTextStyle: GoogleFonts.kurale(fontSize: 18))),
        PageViewModel(
            title: "Watch Trailer anime",
            body: "Here you can watch anime trailer if availabel",
            image: Center(child: Lottie.asset("assets/lottie/watching.json")),
            decoration: PageDecoration(
                bodyTextStyle: GoogleFonts.kurale(fontSize: 18),
                titleTextStyle: GoogleFonts.kurale(fontSize: 18))),
        PageViewModel(
            title: "Character and Voice Actors",
            body:
                "Here you can read information about character and voice actors if available",
            image: Center(child: Lottie.asset("assets/lottie/people.json")),
            decoration: PageDecoration(
                bodyTextStyle: GoogleFonts.kurale(fontSize: 18),
                titleTextStyle: GoogleFonts.kurale(fontSize: 18))),
        PageViewModel(
            title: "Search anime and manga",
            body: "Here you can easyly search anime and manga based on name",
            image: Center(child: Lottie.asset("assets/lottie/searching.json")),
            decoration: PageDecoration(
                bodyTextStyle: GoogleFonts.kurale(fontSize: 18),
                titleTextStyle: GoogleFonts.kurale(fontSize: 18))),
        PageViewModel(
            title: "Index anime and manga",
            body:
                "Here you can easyly search anime and manga based on alphabets",
            image: Center(child: Lottie.asset("assets/lottie/index.json")),
            decoration: PageDecoration(
                bodyTextStyle: GoogleFonts.kurale(fontSize: 18),
                titleTextStyle: GoogleFonts.kurale(fontSize: 18))),
        PageViewModel(
            title: "Find anime",
            body: "Here you can find anime based on seasons",
            image: Center(child: Lottie.asset("assets/lottie/season.json")),
            decoration: PageDecoration(
                bodyTextStyle: GoogleFonts.kurale(fontSize: 18),
                titleTextStyle: GoogleFonts.kurale(fontSize: 18))),
        PageViewModel(
            title: "Find anime",
            body: "Here you can find anime based on Studio",
            image: Center(child: Lottie.asset("assets/lottie/studios.json")),
            decoration: PageDecoration(
                bodyTextStyle: GoogleFonts.kurale(fontSize: 18),
                titleTextStyle: GoogleFonts.kurale(fontSize: 18))),
      ],
    ));
  }
}
