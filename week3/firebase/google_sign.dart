import 'package:firebase/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name='';
String email='';
String imageUrl='';
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User? user = authResult.user;
  assert(user?.email != null);
  assert(user?.displayName != null);
  assert(user?.photoURL!= null);
  name = user!.displayName!;
  email = user!.email!;
  imageUrl = user.photoURL!;
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final User currentUser = await _auth.currentUser!;
  assert(user.uid == currentUser.uid);

  return 'Successfully loggedin: $user';
}
void signOutGoogle() async {
  await googleSignIn.signOut();
}
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google SignIn'),
      ),
      drawer: name != null ? Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.zero,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                      ),
                      radius: 40,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
                title: Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                        return Onboarding();
                      }), ModalRoute.withName('/'));
                }),
          ],
        ),
      ): null,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}