import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/widgets/single_item.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Models/product_model.dart';
class SearchProduct extends StatefulWidget {
  final List<ProductModel> search ;
  SearchProduct({Key? key , required this.search});
  @override
  State<SearchProduct> createState() => _SearchProductState();
}
class _SearchProductState extends State<SearchProduct> {
  List<ProductModel> searchFood = [];
  String query= '';
   searchItem(String query){
   searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
return searchFood;
  }
  @override
  void initState() {
    searchFood.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Search Items", style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,

            )
        )),
        actions: [
          Padding(padding: EdgeInsets.all(8.0) ,
          child: Icon(Icons.menu),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items", style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 18,
                )
            )),

          ),
          Container(
            height: 50,
            child: TextField(
              onChanged: (value){
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: 'search for items in store',
                suffixIcon: Icon(Icons.search)
              ),

            ),
          ),
          SizedBox(height: 10,),
          Column(
            children: _searchItem.map((data){
             // print("pryuittn ${data.productPrice}");
              return SingleItem(
                iscart: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                ProductId: data.productId,
                productunit: data.productUnit,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
