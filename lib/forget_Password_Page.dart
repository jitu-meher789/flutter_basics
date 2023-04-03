// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_catch_clause, empty_catches, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_basics/login_page.dart';

class forgetPasswordPage extends StatefulWidget {
  const forgetPasswordPage({super.key});
  @override
  State<forgetPasswordPage> createState() => _forgetPasswordPageState();
}

class _forgetPasswordPageState extends State<forgetPasswordPage> {

  final _emailControaller = TextEditingController();
  @override
  void dispose() {
    _emailControaller.dispose();
    super.dispose();
  }
  Future passwordReset() async {
    try {
       await FirebaseAuth.instance.
          sendPasswordResetEmail(email: _emailControaller.text.trim());
          showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text('Reset password link sent your email ! \ncheck your email and reset your password'),
        );
        
      });
      
    } on FirebaseAuthException  catch (e) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13,167,159,10),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Mail Address Here',
                        style: TextStyle(
                          fontSize: 21,
                          color: Color.fromRGBO(13,167,159,10),
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Enter the email address associated \n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t with your account',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(13,167,159,10),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      controller: _emailControaller,
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), height: 0.3),
                      textAlign: TextAlign. center,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(13,167,159,10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(13,167,159,10), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(13,167,159,10),
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      onPressed: () {
                        passwordReset();
                      },
                      child: Text('Reset Password'),
                      color: Color.fromRGBO(13,167,159,10),
                      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
