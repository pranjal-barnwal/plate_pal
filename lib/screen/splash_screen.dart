import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plate_pal/complete_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => CompleteLayout()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            // Icon(
            //   Icons.attractions_outlined,
            //   size: 64,
            //   color: Colors.white,
            // ),
            Image.asset(
              'assets/images/splash-screen.gif',
            ),
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Plate",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade900,
                    ),
                  ),
                  const TextSpan(
                    text: "Pal",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Loading exciting restaurants \nfor you!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}