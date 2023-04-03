// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_basics/home_Page.dart';
import 'package:flutter_basics/navigationBar_page.dart';
import 'package:flutter_basics/profile_page.dart';
import 'package:flutter_basics/register_page.dart';
import 'package:flutter_basics/splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'forget_Password_Page.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key, required String title});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final loginformKey = GlobalKey<FormState>();
  // text controller
  final _emailControaller = TextEditingController();
  final _passwordController = TextEditingController();

  get builder => null;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailControaller.text.trim(),
      password: _passwordController.text.trim(),
    ); 
  }

  @override
  void dispose() {
    _emailControaller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Log in",
            style: TextStyle(fontSize: 20),
          ),
          titleSpacing: 5.0,
          centerTitle: true,
          toolbarHeight: 80.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
          elevation: 0.00,
          backgroundColor: Color.fromRGBO(13, 167, 159, 10),
        ),
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 100),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: loginformKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _emailControaller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(13, 167, 159, 10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(13, 167, 159, 10), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(13, 167, 159, 10),
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      ), // icon is 48px widget.
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Color.fromRGBO(13, 167, 159, 10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(13, 167, 159, 10), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(13, 167, 159, 10),
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.fingerprint,
                        color: Colors.white,
                      ), // icon is 48px widget.
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100, // <-- Your width
                    height: 60, // <-- Your height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(
                            13, 167, 159, 10), // background (button) color
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                            fontSize: 19,
                            fontWeight:
                                FontWeight.bold), // foreground (text) color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        signIn().then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => buttomNavigation(
                                      title: '',
                                    ))));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.green,
                              content: Text(
                                'You are logged in',
                                style: TextStyle(color: Colors.white),
                              )),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('Dont have an account?',
                            style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                      ),
                      Container(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const register()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Color.fromRGBO(13, 167, 159, 10),
                                  fontWeight: FontWeight.w900),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  // forget password container
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          forgetPasswordPage()));
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(13, 167, 159, 10),
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // login with google container
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // background (button) color
                              foregroundColor: Color.fromRGBO(13, 167, 159, 10),  // foreground (text) color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(width: 1, color: Color.fromRGBO(13, 167, 159, 10),),
                              ),
                            ),
                            onPressed: () async {
                              await signInWithGoogle();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => buttomNavigation(title: '')));
                              setState(() {});
                            },
                            
                            icon: FaIcon(FontAwesomeIcons.google), 
                            // label: Text(""),
                            label: Text(
                              'Login with gmail',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            
                          ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // google signIn function
  Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  
}
