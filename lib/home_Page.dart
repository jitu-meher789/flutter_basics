// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/profile_page.dart';
import 'package:flutter_basics/notifications_page.dart';

import 'events_page.dart';
import 'login_page.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final user = FirebaseAuth.instance.currentUser!;
  
  
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = [
    homePage(),
    events(),
    notifications(),
    myProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 26, 24, 24),
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 84, 55, 117),
      //   title: Text('Home'),
      //   centerTitle: true,
      // ),
      body: Container(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Signed in as : ${user.email}',
                          style: TextStyle(color: Colors.deepPurple)),
                      MaterialButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        color: Colors.deepPurple,
                        child: Text('Log out'),
                      ),
                    ],
                  ),
                );
              } else {
                return Mylogin(title: '');
              }
            }),
      ),
    );
  }
}
