// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_basics/myProfile.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 24, 24),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 84, 55, 117),
        title: Text('Home'),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        
        animationDuration: Duration(milliseconds: 300),
        color: Color.fromARGB(255, 84, 55, 117),
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
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const myProfile(),
                ),
              );
            },
            child: Icon(
              Icons.person,
              size: 30,
              ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            'Comming Soon',
            style: TextStyle(fontSize: 50, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
