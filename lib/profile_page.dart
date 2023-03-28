// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/updateUser_page.dart';
import 'package:flutter_basics/update_profile_picture.dart';

class myProfile extends StatefulWidget {
  const myProfile({super.key});

  @override
  State<myProfile> createState() => _myProfileState();
}

String name = '';
String branch = '';
String registrationNo = '';
String academics = '';
String birthDate = '';
String phoneNo = '';
String universityName = '';
String collegeName = '';
String email = '';

class _myProfileState extends State<myProfile> {
  @override
  void initState() {
    super.initState();
    getDataOnce_getADocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 24, 24),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("My Profile"),
          centerTitle: true,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => updateImage()));
                        },
                        child: Container(
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
                      ),
                      Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Name : $name',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                child: Text('Branch : $branch',
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
                              child: Text(registrationNo,
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
                              child: Text(academics,
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
                              child: Text(birthDate,
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
                              child: Text(phoneNo,
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
                              child: Text('University',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text(universityName,
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
                              child: Text('College Name',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white38)),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text(collegeName,
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
                    "Email Address",
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
                    child: Center(
                        child: Text(
                      email,
                      style: TextStyle(color: Colors.white38),
                    )),
                  ),
                ),

                SizedBox(
                  width: 30,
                ),

                SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: () {
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext dailogcontext) {
                          return update();
                        });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => update()));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('User Profile Updated', style: TextStyle(color: Colors.white),),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 125, right: 125),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepPurple,
                      ),
                      child: Container(
                        child: Center(
                            child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                style: TextStyle(fontSize: 20),
                                text: " Edit",
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
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

void getDataOnce_getADocuments() {
  final User? user = FirebaseAuth.instance.currentUser!;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final db = FirebaseFirestore.instance;
  final userDocRef = db.collection('users').doc(uid);
  userDocRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      name = data['Name'];
      branch = data['Branch'];
      registrationNo = data['Registration No'];
      academics = data['Academics'];
      birthDate = data['Birth Date'];
      phoneNo = data['Phone No'];
      universityName = data['University Name'];
      collegeName = data['College Name'];
      email = data['Email'];

      print(name);
    },
    onError: (e) => print("Error getting document: $e"),
  );
}
