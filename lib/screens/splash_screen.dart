import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? loginCheck;

  @override
  void initState() {
    super.initState();
    loginCheck = prefs!.getBool('login');
    Timer.periodic(const Duration(seconds: 2), (timer) {
      navigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/bg.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Center(
                child: LottieBuilder.asset(
                  'assets/music.json',
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigate() async {
    if (loginCheck == true) {
      Future(() => Navigator.of(context).pushReplacementNamed('/main'));
    } else {
      Future(() => Navigator.of(context).pushReplacementNamed('/login'));
    }
  }
}
