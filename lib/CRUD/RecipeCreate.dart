import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:MeChef/MainScreens/Drawer.dart';
class Show extends StatefulWidget {
  const Show({Key? key}) : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {

  void done() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Recipes Saved Successfully!"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
    createRecipe();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainOne()));
    });
  }

  final title = TextEditingController();
  final recipe = TextEditingController();

  void createRecipe() {
    CollectionReference sachin =
    FirebaseFirestore.instance.collection('users');
    sachin.add({"recipe": recipe.text, "title": title.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MainOne()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                createRecipe();
              },
              icon: GestureDetector(
                  onTap: () {
                    done();
                  },
                  child: const Icon(Icons.done)))
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Stack(children: [
        SafeArea(
          child: Column(
            children: [
              TextField(
                controller: title,
                style: const TextStyle(fontSize: 30, color: Colors.white),
                maxLines: null,
                decoration: const InputDecoration(
                    hintText: "Recipe's Title",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
              TextField(
                controller: recipe,
                maxLines: null,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Recipes",
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

