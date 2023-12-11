import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MeChef/CRUD/RecipeCreate.dart';
import 'package:MeChef/MainScreens/butterchicken.dart';
import 'package:MeChef/MainScreens/fish%20curry.dart';
import 'package:MeChef/MainScreens/gulabjamun.dart';

class MainOne extends StatefulWidget {
  const MainOne({Key? key}) : super(key: key);

  @override
  State<MainOne> createState() => _MainOneState();
}

class _MainOneState extends State<MainOne> {

  //making user logged out

  void signOut(){
    FirebaseAuth.instance.signOut();
  }


  int _selectedIndex = 0;

  //read data
  List<DocumentSnapshot> documents = [];

  Future<void> getRecipe() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      documents = querySnapshot.docs;
    });
  }

  @override
  void initState() {
    getRecipe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(children: [
            DrawerHeader(
                child: Image.asset(
                  'assets/images/noodles.jpg',
                  fit: BoxFit.cover,
                )),
            ListTile(
                leading: Image.asset(
                  'assets/images/chicken-leg.png',
                  height: 30,
                ),
                title: Text(
                  'Butter Chicken',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Butter()));
                }),
            ListTile(
                leading: Image.asset(
                  'assets/images/fried-fish.png',
                  height: 35,
                ),
                title: Text(
                  'Fish Curry',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Fish()));
                }),
            ListTile(
                leading: Image.asset(
                  'assets/images/gulab-jamun.png',
                  height: 30,
                ),
                title: Text(
                  'Gulab Jamun',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Gulab()));
                }),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              thickness: 2,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                GestureDetector(
                     onTap: signOut,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 20),
                      'LogOut.',
                    ))
              ],
            ),
          ]),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My\nRecipes',
                style: GoogleFonts.aBeeZee(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              Text(
                'Just add your recipes here.',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(children: [
                Container(
                  width: 250,
                  height: 65,
                  decoration: BoxDecoration(
                    color:  Colors.deepOrange,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(5),
                    ),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  child: Text(
                    'Find Yours...',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      documents[index]['title'],
                                      maxLines: null,
                                      style: GoogleFonts.lora(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(documents[index]['recipe'],
                                        maxLines: null,
                                        style: GoogleFonts.robotoSlab(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ]),
                          )),
                    );
                  },
                ),
              ),
              CurvedNavigationBar(
                  index: _selectedIndex,
                  onTap: (index) {
                    if (index == 1) {
                      SystemNavigator.pop();
                    } else if(index==0) {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const Show()));
                    }
                    else {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                  },
                  animationDuration: const Duration(milliseconds: 400),
                  backgroundColor: Colors.black,
                  color: const Color(0xFFF6ECC9),
                  items: const [
                    Icon(Icons.add, color: Colors.deepOrange),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.deepOrange,
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}