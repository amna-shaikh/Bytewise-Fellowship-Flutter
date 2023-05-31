import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/delivery_model.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:food_delivery/screens/checkout/payment/order.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../delivery_detail/single_delivery.dart';
import '../deliveryaddress/delivery_address.dart';
import 'done_message.dart';

class PaymentDetails extends StatefulWidget {
final DeliveryModel deliveryAddresslist;
PaymentDetails({required this.deliveryAddresslist});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}
enum PaymentType {cash, card , }
class _PaymentDetailsState extends State<PaymentDetails> {

  var mypaymenttype = PaymentType.cash;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
  reviewCartProvider.getReviewCartData();
 double discount = 30;
 double Shippingcharge = 200;
    double totaldiscount = 0;
    double totalprice = 0.0;
  double totalproductprice = reviewCartProvider.getTotalPrice();
  if(totalproductprice > 500) {
     totaldiscount = (totalproductprice * discount) / 100;
     totalprice = totalproductprice - totaldiscount;
  }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Confirm Order" , style: GoogleFonts.poppins(
        textStyle: TextStyle(
        fontSize: 20,
    )
    )),
        elevation: 0,
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount", style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,

            )
        )),
        subtitle: Text("Rs . ${totalprice == 0 ?totalproductprice+ Shippingcharge: totalprice+Shippingcharge}", style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,

            )
        )),
        trailing: Container(
          width: 160,
        child: MaterialButton(onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Done()));
        } ,
          color: Colors.green,
          child: Text("Place Order", style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,
            )
        )),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index){
              return Column(
                children: [
                  SingleDelivery(
                    Address: "${widget.deliveryAddresslist.Address}",
                    title: "${widget.deliveryAddresslist.firstname} ${widget.deliveryAddresslist.Lastname}",
                    AddressType: widget.deliveryAddresslist.addtype ==  AddressTypes.Home ? "Home"
                        : widget.deliveryAddresslist.addtype ==  AddressTypes.Work
                        ? "Work" : "Others"  ,
                    phone: "${widget.deliveryAddresslist.phoneno}",

                  ),
                  Divider(),
                  ExpansionTile(
                      title: Text("oder Item ${reviewCartProvider.getReviewCartDataList.length}"),
                  children:reviewCartProvider.getReviewCartDataList.map<Widget>((e){
                    return OrderItem(e: e);
                  }).toList(),
                  ),
                   Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text("Subtotal", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,

                        )
                    )),
                    trailing: Text("Rs. ${totalproductprice}", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                        )
                    )),

                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text("Shipping Charges", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,

                        )
                    )),
                    trailing: Text("Rs. ${Shippingcharge}"),

                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text("Discount", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                        )
                    )),
                    trailing: Text("Rs.  ${discount}%", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                        )
                    )),

                  ),
                   Divider(),
                  ListTile(
                    leading: Text("Payment option", style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,

                        )
                    )),
                  ),
                  RadioListTile(
                      title: Text("Cash", style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18,

                          )
                      )),
                      secondary: Icon(Icons.attach_money , color: primaryColor,),
                      value: PaymentType.cash, groupValue: mypaymenttype, onChanged: (value){
                    setState(() {
                      mypaymenttype = value!;
                    });
                  }),
                  RadioListTile(
                      title: Text("Card", style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18,
                          )
                      )),
                      secondary: Icon(Icons.payment , color: primaryColor,),
                      value: PaymentType.card, groupValue: mypaymenttype, onChanged: (value){
                    mypaymenttype= value!;
                  }),
                ],
              );
            })
      ),
    );
  }
}
