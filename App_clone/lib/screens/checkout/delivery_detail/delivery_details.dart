import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/delivery_model.dart';
import 'package:food_delivery/providers/checkout_provider.dart';
import 'package:food_delivery/screens/checkout/delivery_detail/single_delivery.dart';
import 'package:food_delivery/screens/checkout/deliveryaddress/delivery_address.dart';
import 'package:food_delivery/screens/checkout/payment/payment_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryModel value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryProvider = Provider.of(context);
     deliveryProvider.getDeliveryAdress();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Delivery Details" , style: GoogleFonts.poppins(
          fontSize: 18,
        ),),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DeliveryAddress()));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: MaterialButton(onPressed: (){
          deliveryProvider.getDeliveryAddList.isEmpty?
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DeliveryAddress()))
              : Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=> PaymentDetails(deliveryAddresslist: value,))) ;
        }, child: deliveryProvider.getDeliveryAddList.isEmpty?
        Text("Add new Adress" , style: GoogleFonts.poppins(
          fontSize: 18,
        ),) : Text("Payment Details" , style: GoogleFonts.poppins(
          fontSize: 18,
        ),) ,
        color: primaryColor,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset("assets/location.png" , height: 30),
            title: Text("Deliver to" , style: GoogleFonts.poppins(
              fontSize: 18,
            ),),
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
    deliveryProvider.getDeliveryAddList.isEmpty ?
    Container(
    child: Text("No data" , style: GoogleFonts.poppins(
      fontSize: 18,
    ),),
    )
        :Column(
            children : deliveryProvider.getDeliveryAddList.map<Widget>((e) {
              setState(() {
                value = e;
              });
           return SingleDelivery(
           Address: "${e.Address}",
           title: "${e.firstname} ${e.Lastname}",
    AddressType:  e.addtype ==  AddressTypes.Home ? "Home"
        : e.addtype ==  AddressTypes.Work
        ? "Work" : "Others"  ,
    phone: "${e.phoneno}",

    );

            }).toList(),









          )
        ],
      ),
    );
  }
}
