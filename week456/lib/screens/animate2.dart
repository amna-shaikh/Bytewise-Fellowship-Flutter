import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'onboarding.dart';
class animate2 extends StatefulWidget {
  const animate2({Key? key}) : super(key: key);
  @override
  State<animate2> createState() => _animate2State();
}
class _animate2State extends State<animate2> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
          splash:Lottie.asset('assets/charity-donate.json'),
          /*SingleChildScrollView(
            child:Column(
        children: [
           Image.asset('assets/charity.png'),
          Text('Charity360' , style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),)
        ],
        )),*/
            nextScreen: intro() ,
    backgroundColor: Colors.indigo[900]!,
    splashIconSize: 600,
        duration: 4000,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: Duration(seconds: 2),

           );
  }
}
