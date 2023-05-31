import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/Models/delivery_model.dart';
import 'package:food_delivery/screens/checkout/delivery_detail/delivery_details.dart';
import 'package:food_delivery/screens/checkout/payment/payment_details.dart';

class CheckoutProvider with ChangeNotifier{
  bool isLoading=false;
  TextEditingController Firstname = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController Alternatephone = TextEditingController();
  TextEditingController City = TextEditingController();
  TextEditingController Address = TextEditingController();

   void validator(context,  myAddtype) async{
     if(Firstname.text.isEmpty ||
         Lastname.text.isEmpty ||
         City.text.isEmpty ||
         Address.text.isEmpty ||
         phoneno.text.isEmpty ||
         Alternatephone.text.isEmpty )
   {
     Fluttertoast.showToast(msg: "Please fill All the fields");
   }
else {
  isLoading = true;
  notifyListeners();
  await FirebaseFirestore.instance.collection("AddDeliverAddress")
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .set({
       "Firstname" : Firstname.text,
        "Lastname":Lastname.text,
        "phoneno":phoneno.text,
       "Alternatephone": Alternatephone.text,
        "city": City.text,
        "Address": Address.text,
    "Addresstype" : myAddtype.toString()

  }).then((value)  async {
    isLoading = false;
    notifyListeners();
    await  Fluttertoast.showToast(msg: "Add your delivery address" , fontSize: 15);
   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DeliveryDetails()));
    notifyListeners();
  });
  notifyListeners();
     }
   }

  List<DeliveryModel> deliverymodellist = [];
    getDeliveryAdress() async{
     List<DeliveryModel> newlist = [];
   DeliveryModel deliveryModel;

     DocumentSnapshot db= await FirebaseFirestore.instance.collection("AddDeliverAddress")
    .doc(FirebaseAuth.instance.currentUser?.uid).get();
     if(db.exists){
      deliveryModel = DeliveryModel(
          Address: db.get("Address"),
          firstname: db.get("Firstname"),
          Lastname:db.get("Lastname"),
          phoneno:db.get("phoneno"),
          Alternatephone: db.get("Alternatephone"),
          city:db.get("city"),
          addtype: 'Addresstype');
      newlist.add(deliveryModel);
      notifyListeners();
     }
     deliverymodellist = newlist;
     notifyListeners();
   }
   List<DeliveryModel> get getDeliveryAddList{
      return deliverymodellist;
   }

}