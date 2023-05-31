import 'package:flutter/material.dart';
import 'package:food_delivery/Models/product_model.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/single_item.dart';
class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}
class _WishListState extends State<WishList> {
  showAlertDialog(BuildContext context , ProductModel delete) {
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
        wishListProvider.deleteWishtList(delete.productId);
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

  late WishListProvider wishListProvider;
  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishtListData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("WishList" , style: TextStyle(color: textColor , fontSize: 18),),
      ),
      body:
      ListView.builder(
          itemCount: wishListProvider.getWishList.length,
          itemBuilder: (context , index){
            ProductModel data = wishListProvider.getWishList[index];
            return Column(
              children: [
                SizedBox(height: 10,),
                SingleItem(
                  iscart: true,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  ProductId: data.productId,
                  ProductQuantity: data.productQuantity ?? 1,
                  productunit: data.productUnit ?? "1 kg",
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
