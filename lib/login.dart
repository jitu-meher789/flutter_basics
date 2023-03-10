// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_basics/homePage.dart';
import 'package:flutter_basics/myProfile.dart';
import 'package:flutter_basics/register.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key, required String title});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'),fit: BoxFit.cover,),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log in", style: TextStyle(fontSize: 20),),
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
            icon: Icon(Icons.arrow_back_ios_new,color: Color.fromARGB(137, 253, 253, 253),size:30,),
            onPressed: () { 
            },
          ),
          elevation: 0.00,
          backgroundColor:  Color.fromARGB(255, 84, 55, 117),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100, left: 35),
                  child: Text('Log in with one of the following options.',style: TextStyle(fontSize: 17,color: Colors.white24),),
                ),
                Container(
                  width: 600,
                  padding: EdgeInsets.only(top: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: (){},
                          icon: Icon(
                              Icons.mail_rounded,
                              color: Colors.white,
                              size: 30.0,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 11, 14, 14),
                              padding: EdgeInsets.only(left: 50, right: 60,top: 20, bottom: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              side: const BorderSide(
                                width: 2.0,
                                color: Color.fromARGB(255, 38, 38, 39),
                              ),
                            ),label: Text(''),
                        )
                      ),
                      Container(
                        child: ElevatedButton.icon(
                          onPressed: (){},
                          icon: Icon(
                              Icons.apple,
                              color: Colors.white,
                              size: 30.0,
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 11, 14, 14),
                              padding: EdgeInsets.only(left: 60, right: 50,top: 20, bottom: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              side: const BorderSide(
                                width: 2.0,
                                color: Color.fromARGB(255, 38, 38, 39),
                              ),
                            ), label: Text(''),                       
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3,
                      right: 35,
                      left: 35,
                      ),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextField( 
                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), 
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 11, 14, 14),
                            hintText: 'Email',
                            labelText: 'Email',
                            hintStyle: TextStyle(color: Colors.white24),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(  
                            borderSide: BorderSide(color: Color.fromARGB(255, 84, 55, 117), width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 38, 38, 39), width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextField(
                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), 
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 11, 14, 14),
                            filled: true,
                            hintText: 'Password',
                            labelText: 'Password',
                            hintStyle: TextStyle(color: Colors.white24),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(  
                            borderSide: BorderSide(color: Color.fromARGB(255, 84, 55, 117), width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 38, 38, 39), width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                          SizedBox(
                          height: 30,
                        ),
                       Container(
                         child: ElevatedButton(
                            onPressed: (){
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const homePage()));
                            },
                            child: Text('Login',style: TextStyle(fontSize: 20),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 84, 55, 117),
                              padding: EdgeInsets.only(left: 134, right: 134,top: 18, bottom: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )
                            ),
                          ),
                       ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('Dont have an account?', 
                            style: TextStyle(fontSize: 17,color: Colors.white24)),
                          ),
                          Container(
                            child: TextButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const register()));
                            }, child: Text('Sign up', style: TextStyle(color: Color.fromARGB(255, 84, 55, 117),fontWeight: FontWeight.w900),)),
        
                          )
                        ],
                       ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}