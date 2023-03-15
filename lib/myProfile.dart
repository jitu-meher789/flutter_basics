// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class myProfile extends StatefulWidget {
  const myProfile({super.key});

  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 24, 24),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('My Profile'),
          centerTitle: true,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.deepPurple,
          backgroundColor: Color.fromARGB(255, 26, 24, 24),
          height: 60,
          items: [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.event_available,
              size: 30, 
              
            ),
            Icon(
              Icons.notifications,
              size: 30,
            ),
            Icon(Icons.person),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      border: Border.all(
                        color: Colors.deepPurple,
                        style: BorderStyle.solid,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 226, 255),
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                              color: Colors.deepPurple,
                              style: BorderStyle.solid,
                            )),
                        // color: Colors.white,
                        padding: EdgeInsets.only(left: 20),
                        height: 120,
                        width: 120,
                        child: Image.asset('assets/logos/KarkhanaLogo_01.png'),
                      ),
                      Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Name : Jitu Meher',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                child: Text('Branch : Computer Science',
                                    style: TextStyle(
                                        fontSize: 15.3,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ), // image and name and branck section
                // image and name section
                SizedBox(
                  height: 30,
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text('Registration No',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text("36373SOA123",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white38)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text('Academics',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text('2023 - 2027',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white38)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), // dob and college name section
                //  registration and academic section
                SizedBox(
                  height: 20,
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text('Birth Date',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text("23/05/23",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white38)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text('Phone No',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text("8798764534",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white38)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), // dob and college name section
                // dob and phone section
                SizedBox(
                  height: 20,
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        // height: 80,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text('',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text("",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white38)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        width: 150,
                        // height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text('',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text("",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white38)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), // dob and college name section

                SizedBox(
                  height: 30,
                ),

                Container(
                  child: Text(
                    "University Name",
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple,
                  ),
                  child: Container(
                    child: Text(''),
                  ),
                ),

                SizedBox(
                  width: 20,
                ),

                Container(
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.white38),
                  ),
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple,
                  ),
                  child: Container(
                    child: Text(''),
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

