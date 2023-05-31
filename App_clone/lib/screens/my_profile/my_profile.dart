import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:food_delivery/screens/home/drawer_side.dart';

class MyProfile extends StatefulWidget {
  UserProvider userProvider;
   MyProfile(this.userProvider);
  @override
  State<MyProfile> createState() => _MyProfileState();
}
class _MyProfileState extends State<MyProfile> {
  Widget listtile({required IconData icon , required String title}){
    return Column(
   children: [
     Divider(height: 1,),
      ListTile(
        leading: Icon(icon),
         title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),

)
    ],
    );
}

  @override
  Widget build(BuildContext context) {
    var userdata = widget.userProvider.currentdata;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("My profile" , style: TextStyle(
          fontSize: 18,
          color: textColor
        ),),
      ),
      drawer: DrawerSide(widget.userProvider),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
            children: [
              Container(height: 100,
              color: primaryColor,),
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal:15 , vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),)
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(height: 80,width: 250,padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userdata.userName, style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold,
                                  color: textColor
                                ),),
                                SizedBox(height: 10,),
                                Text(userdata.userEmail)
                              ],
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: primaryColor,
                              child: CircleAvatar(
                                radius: 12,
                                child: Icon(Icons.edit  ,color: scaffoldBackgroundColor,),
                              ),
                            ),
                          ],),
                        ),
                      ],),
                     listtile(icon:Icons.shopping_cart, title: "My Orders"),
                    listtile(icon:Icons.location_on, title: "My Deleivery Address"),
                    listtile(icon:Icons.person, title: "Refer A Friend"),
                    listtile(icon:Icons.file_copy_outlined, title: "Terms and Conditions"),
                    listtile(icon:Icons.privacy_tip, title: "Privacy Policy"),
                    listtile(icon:Icons.add_chart, title: "About"),
                  //  listtile(icon:Icons.exit_to_app_outlined, title: "Log Out"),
                  ],
                ),
              )



            ],
          ),
            Padding(
              padding: EdgeInsets.only(left:30 , top: 40),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: primaryColor,
                child: CircleAvatar(
                 radius: 45,
                  backgroundColor: scaffoldBackgroundColor,
                  backgroundImage:NetworkImage(userdata.userImage ?? ""),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
