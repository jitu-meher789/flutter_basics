import 'package:flutter/material.dart';
import 'package:flutter_basics/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

_navigatetohome() async {
  await Future.delayed(Duration(milliseconds: 2000));
  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Mylogin(title: 'karkhana',))));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.deepPurple,
      body: Center(         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              height: 100,
              width: 400,
              child: Image.asset('assets/logos/KarkhanaLogo_01.png'),
              ),
              Container(
                child: const Text('Powered by karkhana', style: TextStyle(
                  fontSize: 15, 
                  fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}