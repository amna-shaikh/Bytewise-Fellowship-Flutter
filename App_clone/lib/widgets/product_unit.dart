import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Productunit extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
   Productunit({required this.onTap , required this.title});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap : onTap,
      child: Container(
        padding: EdgeInsets.only(left: 5),
        height: 30,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: Colors.grey
            )
        ),
        child: Row(
          children: [
            Expanded(child:Text(title , style: TextStyle(fontSize: 10),)
            ),
            Center(
              child: Icon(Icons.arrow_drop_down_sharp, size: 20,),
            )
          ],
        ),
      ),
    );
  }
}
