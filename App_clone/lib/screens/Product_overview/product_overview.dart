import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/product_model.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/providers/wishlist_provider.dart';
import 'package:food_delivery/screens/Review_cart/review_cart.dart';
import 'package:provider/provider.dart';
import '../../widgets/count.dart';
enum signchar{fill , outline}
class ProductOverview extends StatefulWidget {
 final String ProductName;
 final String ProductImage;
 final int ProductPrice;
 final String productId;
   ProductOverview({
    required this.ProductName ,
     required this.ProductImage,
     required this.ProductPrice,
     required this.productId
});
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}
class _ProductOverviewState extends State<ProductOverview> {

  signchar _character = signchar.fill;
  Widget bottomNavigatorbar({required Color iconColor ,
    required Color backgroundColor  ,
    required Color color ,
    required String title ,
    required IconData iconData,
    required VoidCallback onTap
  }){
return Expanded(child: GestureDetector(
  onTap: onTap,
  child:   Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData ,size: 20, color: iconColor,),
        SizedBox(width: 5,),
        Text(title, style: TextStyle(color: color),)
      ],
    ),
  ),
));
  }
  bool WishList = false;

  getwishListbool(){
    FirebaseFirestore.instance.collection("WishList").doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList").doc(widget.productId).get().then((value) => {
          if(this.mounted){
            if(value.exists){
            setState((){
              WishList = value.get("iswishlist");

    })}
          }
    });
  }
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getwishListbool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorbar(
            backgroundColor: Colors.green,
            color: Colors.black,
            iconColor: Colors.black,
            title: "Add to wishList",
            iconData: WishList == false ? Icons.favorite_border : Icons.favorite,
            onTap: (){
              setState(() {
                WishList = !WishList;
              });
              if(WishList){
                wishListProvider.addWishListData(
                    wishlistId: widget.productId,
                    wishlistname: widget.ProductName,
                    wishlistimage:widget.ProductImage,
                    wishlistprice:widget.ProductPrice ,
                    wishlistquantity: 2,
                    );
              }
              else{
                wishListProvider.deleteWishtList(widget.productId);
              }
            }
          ),
          bottomNavigatorbar(
              backgroundColor: Colors.black,
              color:Colors.white,
              iconColor: Colors.white,
              title: "Go to Cart",
              iconData: Icons.shopping_cart_checkout,
            onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewCart()));
            }
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: textColor,
        ),
        title: Text("Product Overview" , style: TextStyle(color: textColor),),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.ProductName ?? ""),
                      subtitle: Text("Rs. ${widget.ProductPrice}"),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(widget.ProductImage ?? ""),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text("Available options" , textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10) ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 3, backgroundColor: Colors.green,),
                              Radio(
                                value: signchar.fill,
                                groupValue: _character,
                                onChanged: (value){
                                  setState(() {
                                    _character = value!;
                                  });
                                },
                                activeColor: Colors.green[700],)
                            ],
                          ),
                          Text("Rs. ${widget.ProductPrice}"),
                          Count( productId: widget.productId,
                            productImage: widget.ProductImage,
                            productName: widget.ProductName,
                            productPrice: widget.ProductPrice,
                            productUnit: "500 Gram",
                            //productUnit:  widget.P,
                            )
                        ],
                      ),
                    )

                  ],
                ),
              )),
          Expanded(child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("About this Product" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Text("A grocery store is another form of retailing, primarily focusing on selling food,"
                    " along with non-food household products, such as bathroom or cleaning products,"
                    " to their consumers." , style: TextStyle(fontSize: 16 , color: textColor),),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
