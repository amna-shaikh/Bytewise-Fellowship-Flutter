import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/providers/checkout_provider.dart';
import 'package:food_delivery/widgets/textfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}
enum AddressTypes {Home , Work , Other}

class _DeliveryAddressState extends State<DeliveryAddress> {
  var myAddtype = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Add Delivery Address", style: GoogleFonts.poppins(
        textStyle: TextStyle(
        fontSize: 20,
    )
    ) ),
        elevation: 0,
        backgroundColor: Colors.green,
           ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
       // width: 160,
        height: 48,
        child:checkoutProvider.isLoading == false? MaterialButton(onPressed: (){
          checkoutProvider.validator(context , myAddtype);
        },
          color: Colors.green,
            child: Text("Add Address" , style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 18,),),),)
            : Center(child: CircularProgressIndicator(),)
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20) ,
      child: ListView(
        children: [
          ReusableTextField(
              controller: checkoutProvider.Firstname,
              keyboardType: TextInputType.text,
              labeltext: "First Name"),
          ReusableTextField(controller: checkoutProvider.Lastname,
              keyboardType: TextInputType.text,
              labeltext: "Last Name"),
          ReusableTextField(controller: checkoutProvider.phoneno,
              keyboardType: TextInputType.number,
              labeltext: "Mobile no"),
          ReusableTextField(controller: checkoutProvider.Alternatephone,
              keyboardType: TextInputType.number,
              labeltext: "Alternate no"),
          ReusableTextField(controller: checkoutProvider.City,
              keyboardType: TextInputType.text,
              labeltext: "City"),
          ReusableTextField(controller: checkoutProvider.Address,
              keyboardType: TextInputType.text,
              labeltext: "Address"),

       /*   InkWell(
            onTap: (){},
            child: Container(
              height: 47,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Set Location", style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                      )
                  ))
                ],
              ),
            ),
          ),*/
          Divider(height: 12,),
          ListTile(
            title: Text("Address Type" , style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18,

                )
                   )),
          ),
          RadioListTile(
              title: Text("Home" , style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
              )
          )),
              secondary: Icon(Icons.home , color: primaryColor,),
              value: AddressTypes.Home, groupValue: myAddtype, onChanged: (value){
                setState(() {
                  myAddtype = value!;
                });
          }),
          RadioListTile(
              title: Text("Work", style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,

                  )
              )),
              secondary: Icon(Icons.work , color: primaryColor,),
              value: AddressTypes.Work, groupValue: myAddtype, onChanged: (value){
            myAddtype = value!;
          }),
          RadioListTile(
              title: Text("Others", style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                  )
              )),
              secondary: Icon(Icons.other_houses_sharp , color: primaryColor,),
              value: AddressTypes.Other, groupValue: myAddtype, onChanged: (value){
            myAddtype = value!;
          }),
        ],
      ),
      )
    );
  }
}
