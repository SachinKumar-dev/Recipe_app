import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:MeChef/OnboardScreens/OnboardOne.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OnboardScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          body: Stack(
            children: [
              Image.asset(
                "assets/images/onboard.jpg",
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                  alignment: const Alignment(0.5, 0.2),
                  child: Lottie.asset("assets/images/kitchen.json", reverse: true)),
              Positioned(
                  top: 630,
                  left: 100,
                  child: Text(
                    "Me Chef!",
                    textScaleFactor: 1.5,
                    style: GoogleFonts.lobster(
                        fontSize: 30, color: Colors.redAccent),
                  ))
            ],
          ),
        );
    }
}