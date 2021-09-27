import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ptsganjil202112rpl1rifki29/FilmDetail.dart';
import 'package:ptsganjil202112rpl1rifki29/FilmList.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FilmList()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF6D7D7),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Restaurant App',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 30,
                //       fontFamily: "Stanberry"),
                // ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/Restaurant2.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
