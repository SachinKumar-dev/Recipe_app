import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MeChef/UI/mainpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Auth/LogIn.dart';
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  final PageController _controller = PageController();
  bool finalPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              finalPage = (index == 2);
            });
          },
          controller: _controller,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/images/onb1.jpg",
              ),
              Text(
                "Easily add your recipes!",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/images/onb3.png",
              ),
              Text(
                "Easily managed your recipes!",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              )
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/images/onb2.png",
              ),
              Text(
                "Loved it,simply cook it!",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              )
            ]),
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //first skip button here
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text("Skip",
                      style: GoogleFonts.arefRuqaa(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.black)),
                ),
              ),

              //then add smooth page indicator here

              SmoothPageIndicator(controller: _controller, count: 3),

              //if last page then this else
              finalPage
                  ? GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Done',
                    style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                ),
              )
                  : GestureDetector(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Next',
                    style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
