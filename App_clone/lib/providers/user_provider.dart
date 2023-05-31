import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Models/user_model.dart';
class UserProvider with ChangeNotifier{
  void AddUserDetails({
    required User currentuser ,
    required String username,
    required String userimage,
    required String useremail }) async {
    await FirebaseFirestore.instance.collection("usersData").doc(currentuser.uid).set(
        {
     "userName": username,
      "userEmail": useremail,
      "userImage":userimage,
      "userUId": currentuser.uid
    });
  }
  late UserModel currentdata;
  void getUserDetails() async {
    UserModel userModel ;
    var value = await FirebaseFirestore.instance.collection("usersData").
    doc(FirebaseAuth.instance.currentUser?.uid).
    get();
 if(value.exists){
   userModel = UserModel(
       userEmail: value.get("userEmail"),
       userImage:value.get("userImage") ,
       userName:value.get("userName"),
       userUid:value.get("userUId")
   );
   currentdata= userModel;
   notifyListeners();
 }

  }
  UserModel get CurrentuserData{
    return currentdata;
  }


}