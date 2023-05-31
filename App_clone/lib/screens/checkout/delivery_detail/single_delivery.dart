import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleDelivery extends StatelessWidget {
  SingleDelivery({ required this.title , required this.Address , required this.phone , required this.AddressType});
 final String title;
 final String Address;
 final String phone;
 final String AddressType;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(title),
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                padding: EdgeInsets.all(2),
                height: 30,
                decoration: BoxDecoration(
                color: primaryColor,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Center(
                  child: Text(AddressType , style: TextStyle(fontSize: 13 , color: Colors.white),),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.green,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Address , style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black
              ),),
              SizedBox(height: 5,),
              Text(phone , style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black
              ),),
              Divider(
                height: 35,
              )
            ],
          ),
        ),
      ],
    );
  }
}
