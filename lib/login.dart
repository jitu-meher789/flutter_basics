// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_basics/homePage.dart';
import 'package:flutter_basics/myProfile.dart';
import 'package:flutter_basics/register.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          centerTitle: false,
          toolbarHeight: 80.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromARGB(137, 253, 253, 253),
              size: 30,
            ),
            onPressed: () {},
          ),
          elevation: 0.00,
          backgroundColor: Colors.deepPurple,
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
                  style: TextStyle(color: Color.fromARGB(255, 152, 154, 156)),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 152, 154, 156),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 152, 154, 156),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.deepPurple, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.email,
                        color: Colors.grey,
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
                  style: TextStyle(color: Color.fromARGB(255, 152, 154, 156)),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 152, 154, 156),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 152, 154, 156),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.deepPurple, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.lock,
                        color: Colors.grey,
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
                        backgroundColor: Colors.deepPurple, // background (button) color
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                            fontSize: 19,
                            fontWeight:
                                FontWeight.bold), // foreground (text) color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        signIn().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage())));            
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (BuildContext context) => 
                          //            homePage()));
                        //then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const homePage())));
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
                                TextStyle(fontSize: 17, color: Colors.white24)),
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
                                  color: Colors.deepPurple, 
                                  fontWeight: FontWeight.w900),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const register()));
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w600),
                            )),
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
}
