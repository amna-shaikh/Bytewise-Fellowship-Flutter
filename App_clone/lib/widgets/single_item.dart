
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../providers/cart_provider.dart';
import 'count.dart';
class SingleItem extends StatefulWidget {
  bool iscart = false;
  String productName;
  String productImage;
  int? productPrice;
  bool? wishList=false;
  var ProductQuantity;
  String ProductId;
  VoidCallback? onDelete;
  var productunit;
  SingleItem({
    required this.ProductId ,
    required this.iscart ,
    required this.productImage ,
    required this.productName,
     this.productPrice ,
     this.wishList,
     this.ProductQuantity,
     this.onDelete,
     this.productunit
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
    late int? count;
  getCount(){
    setState(() {
       count = widget.ProductQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children : [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(child: Container(height: 100,
              child: Center(child: Image.network(widget.productImage),),)),
            Expanded(
                child: Container(height: 100,
                  child: Column(
              mainAxisAlignment: widget.iscart == false ?MainAxisAlignment.spaceAround : MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(widget.productName , style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
                    Text("Rs. ${widget.productPrice}" , style: TextStyle(color: Colors.grey,),)
                  ],
                ),
              widget.iscart == false ? GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(

                              title: new Text('50 Gram'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(

                              title: new Text('500 Gram'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(

                              title: new Text('1 kg'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),


                          ],
                        );
                      });
                },
                child: Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      children: [
                        Expanded(child:   Text("50 gram" , style: TextStyle(color: Colors.grey,fontSize: 14),)),
                        Center(
                          child: Icon(Icons.arrow_drop_down_outlined , size: 20, color: primaryColor,),
                        )
                      ],
                    ),
                  ),
              ): Text(widget.productunit!)
              ],
            ),)),
            Expanded(child: Container(
              padding:widget.iscart == false? EdgeInsets.symmetric(horizontal: 15, vertical: 30) : EdgeInsets.only(left: 15, right: 15),
              height: 100,
            child:widget.iscart == false?    Count( productId: widget.ProductId,
              productImage: widget.productImage,
              productName: widget.productName,
              productPrice: widget.productPrice!,
            )
              :Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  IconButton(icon : Icon(Icons.delete, size: 30 ,color: Colors.black54), onPressed: widget.onDelete),
                widget.wishList==false?  Container(height: 25,width: 70,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              if(count==1){
                                Fluttertoast.showToast(msg: "You reach minimum limit");
                              }
                              else{
                                setState(() {
                                  count = count! -1;

                                });
                                reviewCartProvider.updateReviewCartData(
                                    cartId: widget.ProductId,
                                    cartname: widget.productName,
                                    cartimage: widget.productImage,
                                    cartprice: widget.productPrice,
                                    cartquantity: count);
                              }
                            },
                              child: Icon(Icons.remove , color: primaryColor, size: 20,)),
                          Text("$count" , style: TextStyle(color: primaryColor,fontSize: 14),),
                          InkWell(
                            onTap: (){
                              if(count!<10){
                                setState(() {
                                 count = count! + 1;
                                });
                                reviewCartProvider.updateReviewCartData(
                                    cartId: widget.ProductId,
                                    cartname: widget.productName,
                                    cartimage: widget.productImage,
                                    cartprice: widget.productPrice,
                                    cartquantity: count!);
                              }
                            },
                              child: Icon(Icons.add , color: primaryColor, size: 20,)),
                        ],
                      ),
                    ),
                  ): Container()
                ],
              ),
            )
            )),

          ],
        ),

      ),
        widget.iscart==false? Container():Divider(
          height: 1,
          color: Colors.black45,
        )
    ]);
  }
}
