// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  final _nameController = TextEditingController();
  final _branchContorller = TextEditingController();
  final _registrationNumberContorller = TextEditingController();
  final _academicsContorller = TextEditingController();
  final _birthDateContorller = TextEditingController();
  final _phoneNumberContorller = TextEditingController();
  final _universityNameContorller = TextEditingController();
  final _collegeNameController = TextEditingController();

  var name;
  var branch;
  var registrationNo;
  var academics;
  var birthDate;
  var phoneNo;
  var universityName;
  var collegeName;

  @override
  void dispose() {
    _nameController.dispose();
    _branchContorller.dispose();
    _registrationNumberContorller.dispose();
    _academicsContorller.dispose();
    _birthDateContorller.dispose();
    _phoneNumberContorller.dispose();
    _universityNameContorller.dispose();
    _collegeNameController.dispose();
    super.dispose();
  }

 
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      elevation: 50,
      title: Text('Enter Your Details'),
      scrollable: true,
      content: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               TextField(
                autofocus: true,
                controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name',hintText: 'Name',),
              ),
              TextField(
                autofocus: true,
                controller: _branchContorller,
                  decoration: InputDecoration(labelText: 'Branch',hintText: 'Btech(CS)',),
              ),
              TextField(
                controller: _registrationNumberContorller,
                decoration: InputDecoration(
                    labelText: 'Registration No.', hintText: '367HG748949'),
              ),
              TextField(
                controller: _academicsContorller,
                decoration: InputDecoration(
                    labelText: 'Academics', hintText: '2000 - 2000'),
              ),
              TextField(
                controller: _birthDateContorller,
                decoration: InputDecoration(
                    labelText: 'Birth Date', hintText: '12/12/1999'),
              ),
              TextField(
                controller: _phoneNumberContorller,
                decoration: InputDecoration(
                    labelText: 'Phone No.', hintText: '99999 99999.'),
              ),
              TextField(
                controller: _universityNameContorller,
                decoration: InputDecoration(
                    labelText: 'University Name', hintText: 'University Name'),
              ),
              TextField(
                controller: _collegeNameController,
                decoration: InputDecoration(
                    labelText: 'college Name', hintText: 'College Name.'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            submit();
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  void submit() {
    name = _nameController.text;
    branch = _branchContorller.text;
    registrationNo = _registrationNumberContorller.text;
    academics = _academicsContorller.text;
    birthDate = _birthDateContorller.text;
    phoneNo = _phoneNumberContorller.text;
    universityName = _universityNameContorller.text;
    collegeName = _collegeNameController.text;
    updateUser();
    Navigator.of(context).pop();
  }

  void updateUser() async {
    final User? user = FirebaseAuth.instance.currentUser!;
    final uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);

    final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

        userDocRef.set({
          'Name' : name,
          'Branch' : branch,
          'Registration No' : registrationNo,
          'Academics' : academics,
          'Birth Date' : birthDate,
          'Phone No': phoneNo,
          'University Name' : universityName,
          'College Name' : collegeName,
          'Email' : user?.email,
        });
    }
}
