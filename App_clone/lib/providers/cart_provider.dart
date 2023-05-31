import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Models/reviewcart_model.dart';

class ReviewCartProvider with ChangeNotifier{
  void CartReviewDetails({
     required String cartId ,
     required String cartname ,
    required String cartimage ,
     required int cartprice ,
    int? cartquantity,
    var cartunit

  }) async {
    FirebaseFirestore.instance.collection("ReviewCart").doc(
        FirebaseAuth.instance.currentUser?.uid).collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartname": cartname,
      "cartimage": cartimage,
      "cartprice": cartprice,
      "cartquantity": cartquantity,
      "cartunit":cartunit,
      "isAdd" : true
    });
  }

  void updateReviewCartData({
     String? cartId ,
     String? cartname ,
     String? cartimage ,
     int? cartprice ,
     int? cartquantity,

  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartname": cartname,
        "cartimage": cartimage,
        "cartprice": cartprice,
        "cartquantity": cartquantity,
        "isAdd" : true,

      },
    );
  }


     List<ReviewCartModel> cartDataList=[];
     void getReviewCartData() async{
       List<ReviewCartModel> newlist=[];
     QuerySnapshot reviewcartValue = await  FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser?.uid).collection("YourReviewCart").get();
     reviewcartValue.docs.forEach((element) {
       ReviewCartModel reviewCartModel = ReviewCartModel(
           cartId:element.get("cartId") ,
           cartImage: element.get("cartimage") ,
           cartName: element.get("cartname") ,
           cartPrice:element.get("cartprice") ,
           cartQuantity: element.get("cartquantity") ,
           cartUnit: element.get("cartunit")
       );
       newlist.add(reviewCartModel);
     });
      cartDataList = newlist;
      notifyListeners();
     }
  List<ReviewCartModel>    get  getReviewCartDataList {
       return cartDataList;
     }

  getTotalPrice(){
    double total = 0.0;
    cartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;

    });
    return total;
  }

  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }

}