import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:food_delivery/widgets/decide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../home/home_screen.dart';
class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash:Lottie.asset('assets/successfully.json'),
        nextScreen: Decode() ,
        backgroundColor: Colors.grey!,
        splashIconSize: 600,
        duration: 4000,
        splashTransition: SplashTransition.sizeTransition,
        animationDuration: Duration(seconds: 1),

      );
  }
}
