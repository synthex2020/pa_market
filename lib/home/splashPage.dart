import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pa_market/home/home.dart';


// Typically a splash page is a welcome page which means we must have a mechanism in place to only display it for a bit
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1D3D0E),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          image: AssetImage('images/pa_logo.png'),
        ),
        SizedBox(height: 50.0),
        ElevatedButton(
          onPressed: null,
          child: Text('Get Started'),
        ),
      ],
    );
  }
}


// TODO: Please observe below a splash page as by a tutorial that can be found here: https://medium.com/@rushabh.shah065/splash-screen-flutter-create-customize-splash-screen-for-flutter-android-ios-a380a199793c

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  
  final splashDelay = 3;
  
  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }
  
  void navigationPage () {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadWidget();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: AssetImage('images/pa_logo.png'),
          ),
          SizedBox(height: 50.0),
          ElevatedButton(
            onPressed: null,
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}

