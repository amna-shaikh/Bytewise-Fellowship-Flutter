import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../screens/home/home_screen.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;
  _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);
      userProvider.AddUserDetails(
          currentuser: user!,
          username: user.displayName!,
          userimage: user.photoURL!,
          useremail: user.email!);

      return user;
    } catch (e) {
    }
  }


  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image:DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage("assets/bg.jpg"))
        ),
        child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
             Container(
               height: 400,
               width: double.infinity,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text("Sign in to continue" , style: GoogleFonts.poppins(
                   fontSize: 28,
                   fontWeight: FontWeight.w700
               )),

                   Text("Shop Now" ,
                     style: GoogleFonts.poppins(
                         fontSize: 28,
                         fontWeight: FontWeight.w700
                     )),

                   Column(
                     children: [
                       SignInButton(
                         Buttons.Google,
                         text: "Sign up with Google",
                         onPressed: () async {
                         await  _googleSignUp().then(
                               (value) => Navigator.of(context).pushReplacement(
                               MaterialPageRoute(builder: (context) => HomeScreen()
                               ), ),
                            );
                         },
                       ),
                       SizedBox(height: 10,),
                       SignInButton(
                         Buttons.Apple,
                         text: "Sign up with Apple",
                         onPressed: () {},
                       ),
                     ],
                   ),

                 Column(
                   children: [
                     Text("By signing this your are agreeing to our",  style: GoogleFonts.poppins(
                     fontSize: 18,
                     fontWeight: FontWeight.w700
                 )),

                     Text("Terms and Policy", style: GoogleFonts.poppins(
                         fontSize: 18,
                         fontWeight: FontWeight.w700
                     ))],
                 ),
] ),

             ),
        ],
      ),
      ),
    );
  }
}

