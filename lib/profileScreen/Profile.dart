import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Positioned(
          left: 12,
          top: 30,
          child: Container(
            height: 400,
            width: 370,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/back3.jpg"),
                  fit: BoxFit.cover),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      alignment: const Alignment(-0.9, -0.9),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Back",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.black, fontSize: 20),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.more_horiz_rounded,
                                    size: 30,
                                  )),
                            ],
                          ),
                          const Expanded(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100,
                            backgroundImage:
                                AssetImage("assets/images/mainn.jpg"),
                          )),
                        ],
                      )),
                )),
          ),
        ),
        Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                color: Colors.black,
                width: 5,
              ))),
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                color: Colors.black,
                width: 5,
              ))),
            ),
          ],
        ),
      ]),

    ),
    );
  }
}
