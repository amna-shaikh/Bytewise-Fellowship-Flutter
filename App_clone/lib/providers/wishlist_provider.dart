import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Models/product_model.dart';

class WishListProvider with ChangeNotifier{

  void addWishListData({
    required String wishlistId,
    required String wishlistname,
    required String wishlistimage,
    required int wishlistprice,
    required int wishlistquantity,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishlistId)
        .set(
      {
        "wishListId": wishlistId,
        "wishListname": wishlistname,
        "wishListimage": wishlistimage,
        "wishListprice":wishlistprice,
        "wishListquantity": wishlistquantity,
        "iswishlist":true,
      },
    );
  }


  List<ProductModel> wishList = [];

  getWishtListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
          (element) {
        ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListimage"),
          productName: element.get("wishListname"),
          productPrice: element.get("wishListprice"),
        productQuantity: element.get("wishListquantity"),
        );
        newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }
  deleteWishtList(wishListId){
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList").doc(wishListId).delete();
  }


}