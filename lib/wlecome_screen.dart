import 'package:flutter/material.dart';
import 'package:hellow_world/home_screen.dart';
import 'package:hellow_world/login_screen.dart';
//import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    _mockCheckforSession().then(
      (status) {
        if (status) {
          _navigationToHome();
        }else {
          _navigationToLogin();
        }
      }

    );
  }

  Future<bool> _mockCheckforSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {}); 

    return false;

  }
  void _navigationToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => Homescreen()
      )
    );
  }
   void _navigationToLogin(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Container(color: Color(0xff2DF6AE)),
              ),
              Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.grey,
                child: Container(
                 child: Text(
                   "Kaarvan",
                   style: TextStyle( 
                     fontSize: 70,
                     fontFamily: 'RobotoMono'
                   ),
                 ), 
                ),
              )
              
              
              

              
          ],
        ),
      ),
      
    );
  }
}