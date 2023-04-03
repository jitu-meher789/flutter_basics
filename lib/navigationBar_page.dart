// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_basics/events_page.dart';
import 'package:flutter_basics/home_Page.dart';
import 'package:flutter_basics/notifications_page.dart';
import 'package:flutter_basics/profile_page.dart';

class buttomNavigation extends StatefulWidget {
  const buttomNavigation({super.key, required String title});

  @override
  State<buttomNavigation> createState() => _buttomNavigationState();
}

class _buttomNavigationState extends State<buttomNavigation> {
  int index = 0;
  final screens = [
    homePage(title: '',),
    events(),
    notifications(),
    myProfile(),
  ];
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor:Color.fromRGBO(13,167,159,10),
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 10,fontWeight: FontWeight.w500),
          )
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Color.fromRGBO(13,167,159,10),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          animationDuration: Duration(seconds: 2),
          onDestinationSelected: (index) => 
              setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined,color: Colors.white,),
              selectedIcon: Icon(Icons.home,color: Colors.white),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.event_outlined,color: Colors.white), 
              selectedIcon: Icon(Icons.event,color: Colors.white),
              label: 'Events',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications_outlined,color: Colors.white), 
              selectedIcon: Icon(Icons.notifications,color: Colors.white),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_2_outlined,color: Colors.white), 
              selectedIcon: Icon(Icons.person,color: Colors.white),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}