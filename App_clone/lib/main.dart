import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:food_delivery/providers/checkout_provider.dart';
import 'package:food_delivery/providers/product_provider.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:food_delivery/providers/wishlist_provider.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [  ChangeNotifierProvider<ProductProvider>(
    create: (context) =>ProductProvider()),
      ChangeNotifierProvider<UserProvider>(
          create: (context) =>UserProvider()),
      ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) =>ReviewCartProvider()),
      ChangeNotifierProvider<WishListProvider>(
          create: (context) =>WishListProvider()),
      ChangeNotifierProvider<CheckoutProvider>(
          create: (context) =>CheckoutProvider()),
    ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor
        ),
        home: StreamBuilder(
          stream:  FirebaseAuth.instance.authStateChanges(),
            builder: (context , snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
           else  if(snapshot.hasData){
              return  HomeScreen();
            }
            else if(snapshot.hasError){
              return Text("Facing Error");
            }
            else {
              return SignIn();
            }
            }
        )
       // HomeScreen(),
      ),
    );
  }
}

