// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/home_Page.dart';
import 'package:flutter_basics/login_page.dart';


import 'navigationBar_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    whereToGo();
  }

  void whereToGo() async {
    //  await Future.delayed(Duration(seconds: 2));
    //  Navigator.pushReplacement(context,MaterialPageRoute(builder: ((context) => Mylogin(title: '',))));
  
      if(user != null) {
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushReplacement(context,MaterialPageRoute(builder: ((context) => buttomNavigation(title: '',))));
      }else{
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushReplacement(context,MaterialPageRoute(builder: ((context) => Mylogin(title: '',))));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 167, 159, 10),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 400,
              child: Image.asset('assets/logos/KarkhanaLogo_01.png'),
            ),
            Container(
              child: const Text(
                'Powered by karkhana',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}