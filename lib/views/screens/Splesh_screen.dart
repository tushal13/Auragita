import 'dart:async';

import 'package:flutter/material.dart';

class SPLASH_SCREEN extends StatefulWidget {
  const SPLASH_SCREEN({Key? key}) : super(key: key);

  @override
  State<SPLASH_SCREEN> createState() => _SPLASH_SCREENState();
}

class _SPLASH_SCREENState extends State<SPLASH_SCREEN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('home');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E5CE),
      body: Center(
        child: Image(
          image: AssetImage(
            "assets/images/splesh.jpg",
          ),
          height: 250,
        ),
      ),
    );
  }
}
