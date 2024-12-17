import 'dart:async';

import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;

  _startDelay(){

    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, 'login');

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          image: DecorationImage(
            image: AssetImage('assets/images/splashpic.jpeg'),
            fit: BoxFit.cover, // Adjust the image to cover the entire screen
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
