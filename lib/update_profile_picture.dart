// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class updateImage extends StatefulWidget {
  const updateImage({super.key});

  @override
  State<updateImage> createState() => _updateImageState();
}

class _updateImageState extends State<updateImage> {

// Future selectFile() async {

// }
// Future uploadFile() async {

// }

  @override
  Widget build(BuildContext context) {
    var hello;
    var lello;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: lello, 
                  child: Text('Select File',style: TextStyle(color: Colors.green),),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: ElevatedButton(
                  onPressed: hello, 
                  child: Text('Upload File',style: TextStyle(color: Colors.green),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}