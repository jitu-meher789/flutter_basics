import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class events extends StatefulWidget {
  const events({super.key});

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Events Page',style: TextStyle(color: Color.fromRGBO(13, 167, 159, 10))),
        ),
      ),
    );
  }
} 




// keytool -list -v -keystore C:\Users\fablab\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android