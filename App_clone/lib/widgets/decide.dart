import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
class Decode extends StatefulWidget {
  const Decode({Key? key}) : super(key: key);

  @override
  State<Decode> createState() => _DecodeState();
}

class _DecodeState extends State<Decode> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose'),

      actions: <Widget>[
        ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          } ,
          child: const Text('Log Out'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())),
          child: const Text('Home'),
        ),
      ],
    );

  }
}
