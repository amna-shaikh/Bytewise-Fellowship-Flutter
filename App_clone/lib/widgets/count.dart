import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
class Count extends StatefulWidget {
  String productName;
  String productImage;
  int productPrice;
   String productId;
  var productUnit;
   Count({
  required this.productId,
  required this.productImage,
  required this.productName,
  required this.productPrice,
     this.productUnit

});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {

  int count =1;
  bool iscount= false;

  getAddandQuantity(){
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get().then((value) => {

        if(this.mounted){
          if(value.exists){
            setState((){
            count = value.get("cartquantity");
          //  print("count value initial: $count");
            iscount = value.get("isAdd");
          }),}

        }
    });
  }
  @override
  Widget build(BuildContext context) {
    getAddandQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return  Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Colors.grey
          )
      ),
      child: iscount == true ?Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: (){

                if(count==1){
                  setState(() {
                    iscount =  false;

                  });
                  reviewCartProvider.reviewCartDataDelete(widget.productId);
                }

               else if(count >1){
                  setState(() {
                    count--;
                  });
                  reviewCartProvider.updateReviewCartData(
                    cartId: widget.productId,
                    cartname: widget.productName,
                    cartimage: widget.productImage,
                    cartprice: widget.productPrice,
                    cartquantity: count,

                  );

                }
              },
              child: const Icon(Icons.remove , size: 15,)),
          Text("${count}" ,style: TextStyle(color: textColor , fontWeight: FontWeight.bold),),
          InkWell(
              onTap: (){
                setState(() {
                  count++;
                });
                reviewCartProvider.updateReviewCartData(
                  cartId: widget.productId,
                  cartname: widget.productName,
                  cartimage: widget.productImage,
                  cartprice: widget.productPrice,
                  cartquantity: count,
                );
              },
              child: const Icon(Icons.add ,size: 15,))
        ],
      ):Center(
        child: InkWell(
          onTap: (){
            setState(() {
              iscount =  true;
              print("count vaue is ............ $count");
            });
            reviewCartProvider.CartReviewDetails(
                cartId: widget.productId,
                cartname: widget.productName,
                cartimage: widget.productImage,
                cartprice: widget.productPrice,
                cartquantity: count,
              cartunit: widget.productUnit
           );
          },
          child: Text("Add" , style: TextStyle(
            color: Colors.green,

          ),),
        ),
      )
    );
  }
}
