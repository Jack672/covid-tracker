import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:covid_tracker/Screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spin(
              infinite: true,
              child: Center(
                child: Image(
                  image: AssetImage("images/virus.png"),
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Text("Covid-19",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
            Text("Tracker App",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
