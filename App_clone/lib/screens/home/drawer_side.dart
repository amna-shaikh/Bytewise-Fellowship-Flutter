import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/Review_cart/review_cart.dart';
import 'package:food_delivery/screens/home/home_screen.dart';
import 'package:food_delivery/screens/my_profile/my_profile.dart';

import '../../auth/sign_in.dart';
import '../../providers/user_provider.dart';
import '../wishlist/wishlist.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
   DrawerSide(this.userProvider) ;

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTiles({required IconData icon , required String title , required VoidCallback onTap}){
    return ListTile(
      onTap: onTap,
      leading: Icon(icon , size: 32,),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userdata = widget.userProvider.currentdata;
    return Drawer(
      child: Container(
        color: Colors.green,
        child: ListView(
          children: [
            DrawerHeader(child: Row(
              children: [
                Flexible(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.green,
                      child: Image.network(userdata.userImage ?? ""),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(userdata.userName),
                    SizedBox(height: 7,),
                    Container(
                      height: 30,
                      child: Text(userdata.userEmail),
                    ),
                  ],
                ),
              ],),
            ),
            listTiles(icon: Icons.home, title: 'Home' , onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
            listTiles(icon: Icons.add_shopping_cart_outlined, title: 'Cart' , onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewCart()));
            }),
            listTiles(icon: Icons.person, title: 'Profile' , onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfile(widget.userProvider)));
            }),
            listTiles(icon: Icons.notification_important_sharp, title: 'Notification' , onTap: (){}),
            listTiles(icon: Icons.star, title: 'Rating & Reviews' , onTap: (){}),
            listTiles(icon: Icons.favorite, title: "Wishlist" , onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => WishList()));
            }),
            listTiles(icon: Icons.content_copy_outlined, title: 'Complaint' , onTap: (){}),
            listTiles(icon: Icons.logout_outlined, title: 'Logout' , onTap: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
            }),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Contact"),
                      Text("0336-2346710")
                    ],
                  ),
                  SizedBox(height: 5,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Email"),
                        Text("amnashaikh090@gmail.com")
                      ],
                    ),
                  ),


                ],
              ),

            )
          ],
        ),
      ),

    );
  }
}
