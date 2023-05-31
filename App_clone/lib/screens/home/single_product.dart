import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/product_model.dart';
import 'package:food_delivery/widgets/product_unit.dart';

import '../../constants/colors.dart';
import '../../widgets/count.dart';

class SingleProduct extends StatefulWidget {
  final String ProductImage;
  final String ProductName;
  final int ProductPrice;
  final String ProductId;
  final  VoidCallback onTap;
  final ProductModel? ProductUnit;

   SingleProduct({
    required this.ProductImage ,
    required this.ProductName ,
    required this.onTap ,
    required this.ProductPrice ,
    required this.ProductId,
     this.ProductUnit,
   });

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.ProductUnit!.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:[ Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 250,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white30
              //Color(0xffd9dad9)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child:Image.network(widget.ProductImage ,height: 100, width: 100,),
                  ),
                ),

                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.ProductName),
                          Text("Rs. ${widget.ProductPrice}/${unitData == null?firstValue:unitData} "),
                          SizedBox(height: 5,),
                          Row(children: [
                            Expanded(child:Productunit(onTap: (){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:widget.ProductUnit!.productUnit.map<Widget>((data){
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                                                    child: InkWell(
                                                      onTap: () async{
                                                        setState(() {
                                                          unitData = data;
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        data,
                                                        style: TextStyle(
                                                            color: primaryColor,
                                                            fontSize: 18),
                                                      ),

                                                    ),
                                                  )
                                                ],
                                              );
                                      }).toList(),

                                    );
                                  });
                            }, title: unitData == null?firstValue:unitData,)

                            ),
                            SizedBox(width: 5,),
                           Count(
                               productId: widget.ProductId,
                             productImage: widget.ProductImage,
                             productName: widget.ProductName,
                             productPrice: widget.ProductPrice,
                               productUnit: unitData == null?firstValue:unitData
                           )

                          ],),
                        ],
                      ),
                    )
                ),
              ],
            ),

          ),
          ]),
    );
  }
}
