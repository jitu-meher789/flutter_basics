// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/homePage.dart';
import 'package:flutter_basics/login.dart';
import 'package:flutter_basics/main.dart';
import 'package:flutter_basics/myProfile.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/src/material/icons.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  final formKey = GlobalKey<FormState>();
  final _yourNameController = TextEditingController();
  final _userNameContorller = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();



  @override
  void dispose() {
    _yourNameController.dispose();
    _userNameContorller.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    super.dispose();
  }

  Future signUp () async {
    if(passwordConfirmed() ) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim(),
      );
      addUserDetails(
        _yourNameController.text.trim(), 
        _userNameContorller.text.trim(), 
        _emailController.text.trim(),
      );
    }
  }

  Future addUserDetails (String yourName, String userName, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name' : yourName,
      'User Name' : userName,
      'Email' : email,
    });
  }


  bool passwordConfirmed () {
    if(_passwordController.text.trim() == _confirmedPasswordController.text.trim()) {
      return true;
    }else{
      return false;
    }
  }


   

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
          titleSpacing: 5.0,
          centerTitle: true,
          toolbarHeight: 80.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromARGB(137, 253, 253, 253),
              size: 30,
            ),
            onPressed: () {},
          ),
          elevation: 0.00,
          backgroundColor: Colors.deepPurple,
        ),
        backgroundColor: Color.fromARGB(255, 19, 19, 19),

        body: Container( 
          padding: EdgeInsets.only(left: 10, right: 10,top: 80),
          
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  TextFormField(
                    controller: _yourNameController,
                    style: TextStyle(color: Color.fromARGB(255, 152, 154, 156)),
                    decoration: InputDecoration(
                      labelText: "Your Name",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                      ),
                      hintText: "Your Name",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ), // icon is 48px widget.
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "enter you name"),
                      MinLengthValidator(6, errorText: "User name must be atleat  6 characters"),
                    ]),                    

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _userNameContorller,
                    style: TextStyle(color: Color.fromARGB(255, 152, 154, 156)),
                    decoration: InputDecoration(
                      labelText: "User Name",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                      ),
                      hintText: "User Name",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.person_search,
                          color: Colors.grey,
                        ), // icon is 48px widget.
                      ),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "enter you name"),
                      MinLengthValidator(6, errorText: "User name must be atleat  6 characters"),
                    ]),                    

                  ),
                  SizedBox( 
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Color.fromARGB(255, 152, 154, 156)),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(  
                          Icons.lock,
                          color: Colors.grey,
                        ), // icon is 48px widget.
                      ), 
                    ),
                     validator: MultiValidator([
                      RequiredValidator(errorText: "Required"),
                      EmailValidator(errorText: "Enter a valid email address")
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: Color.fromARGB(255, 152, 154, 156)),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ), // icon is 48px widget.
                      ),
                    ),
                     validator: MultiValidator([
                      RequiredValidator(errorText: "Required"),
                      MinLengthValidator(4, errorText: "password length must be atleast 4 length"),
                      MaxLengthValidator(10, errorText: "password length not more than 10 digit"),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _confirmedPasswordController,
                    style: TextStyle(color: Color.fromARGB(255, 152, 154, 156)),
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                      ),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 152, 154, 156),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.deepPurple, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 1.5,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ), // icon is 48px widget.
                      ),
                    ),
                    // validator: MultiValidator([
                    //   RequiredValidator(errorText: "enter phone no"),
                    //   MinLengthValidator(10, errorText: "Enter valid phone number"),
                    // ]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 100, // <-- Your width
                    height: 60, // <-- Your height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple, // background (button) color
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 19,fontWeight: FontWeight.bold), // foreground (text) color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // final isValidForm = formKey.currentState!.validate();
                        // if(isValidForm){
                        //   signUp();
                        // }
                        signUp().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mylogin(title: 'title'))));
                      },
                      child: const Text("Create Account"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('Already have an account?', 
                            style: TextStyle(fontSize: 17,color: Colors.white24)),
                          ),
                          Container(
                            child: TextButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Mylogin(title: '',)));
                            }, child: Text('Login', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900),)),
                          )
                        ],
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
