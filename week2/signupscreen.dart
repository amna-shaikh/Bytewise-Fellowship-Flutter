import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password= TextEditingController();
void login(String email , password) async{
  try{
    Response response =await post(Uri.parse('https://reqres.in/api/register'), //for login just replace register with login
        body: {
      'email' : email,
    'password' : password

    }
    );
    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      print(data['token']);
      print('success');
    }
    else{
      print('fail');
    }
  }
      catch(e){
    print(e.toString());
      }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: 'Email'
            ),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
                hintText: 'password'
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              login(email.text.toString() , password.text.toString());
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('SignUp'),),
            ),
          )
        ],
      ),
    );
  }
}
