import 'package:flutter/material.dart';
import 'package:food_delivery/Models/reviewcart_model.dart';
import 'package:google_fonts/google_fonts.dart';
class OrderItem extends StatelessWidget {
  late  ReviewCartModel e;
  OrderItem({required this.e});

  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(e.cartImage , width: 60,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(e.cartName, style: GoogleFonts.poppins(fontSize: 15),),
          Text(e.cartUnit , style: GoogleFonts.poppins(fontSize: 15),),
          Text("Rs. ${e.cartPrice}" , style: GoogleFonts.poppins(fontSize: 15),)
        ],
      ),
      subtitle: Text("${e.cartQuantity}", style: GoogleFonts.poppins(fontSize: 15),),

    );
  }
}
