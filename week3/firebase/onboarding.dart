
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'google_sign.dart';
import 'googlesign.dart';
import 'mainscreen.dart';
import 'Registeration.dart';
import 'package:auth_buttons/auth_buttons.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}
class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/intro.png'),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  LoginScreen()),
              );
            }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),

                child: Text('Login')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  RegisterEmailSection()),
              );
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                child: Text('Create Account')),
            SizedBox(height: 20,),
            GoogleAuthButton(
                onPressed: () {
                 signInWithGoogle().whenComplete(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return WelcomeScreen();
                        },
                      ),
                    );
                  });
                },
                darkMode: true
            ),
            SizedBox(height: 20,),
            FacebookAuthButton(
              onPressed: (){

              },
            )
          ],
        ),
      ),
    );
  }
}

