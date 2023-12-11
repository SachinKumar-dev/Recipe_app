import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:MeChef/Auth/signup.dart';
import 'authentication.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  //here we will proceed for login screen
  final email = TextEditingController();
  final pass = TextEditingController();

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ));
      },
    );
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: pass.text);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Auth()),
            (route) => false);
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    pass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                    'assets/images/Tablet.png'
                  )),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: GoogleFonts.aBeeZee(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ))),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 400,
                child: TextField(
                  obscureText: true,
                  controller: pass,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: GoogleFonts.aBeeZee(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      onPressed: signIn,
                      child: Text(
                        "LogIn",
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text(
                        "SignUp",
                        style: GoogleFonts.aBeeZee(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
