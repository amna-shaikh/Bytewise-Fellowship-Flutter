import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:food_delivery/screens/checkout/delivery_detail/delivery_details.dart';
import 'package:provider/provider.dart';

import '../../Models/reviewcart_model.dart';
import '../../widgets/single_item.dart';
class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context , ReviewCartModel delete) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () {
           reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("Are you sure you want to delete?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
     reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text("Rs. ${reviewCartProvider.getTotalPrice()}", style: TextStyle(color: Colors.green[700]),),
        trailing: Container(
          width: 160,
          child: MaterialButton(onPressed: (){
            if(reviewCartProvider.getReviewCartDataList.isEmpty){

               Fluttertoast.showToast(msg: "NO Item found");

            }
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=> DeliveryDetails() ));
            
            
          } , child: Text("check out"),
          color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Review Cart" , style: TextStyle(color: textColor , fontSize: 18),),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty ? Center(
        child: Text("No data")  ):
       ListView.builder(
          itemCount: reviewCartProvider.getReviewCartDataList.length,
          itemBuilder: (context , index){
            ReviewCartModel data = reviewCartProvider.getReviewCartDataList[index];
         return Column(
           children: [
             SizedBox(height: 10,),
             SingleItem(
                 iscart: true,
                 wishList: false,
                 productImage: data.cartImage,
                 productName: data.cartName,
                 productPrice: data.cartPrice, ProductId: data.cartId,
               ProductQuantity: data.cartQuantity,
               productunit: data.cartUnit,
               onDelete: () {
                 showAlertDialog(context , data);
               },

             )


           ],
         );
      }),
    );
  }
}
