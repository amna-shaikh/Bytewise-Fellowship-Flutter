import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/Usermodel.dart';
class userscreen extends StatefulWidget {
  const userscreen({Key? key}) : super(key: key);

  @override
  State<userscreen> createState() => _userscreenState();
}

class _userscreenState extends State<userscreen> {
  List<Usermodel> userList = [];
  Future<List<Usermodel>> getusers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
      userList.add(Usermodel.fromJson(i));
      }
      return userList;
    }

    else {
    return  userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
       Expanded(child: FutureBuilder(
         future: getusers(),
         builder: (context , AsyncSnapshot<List<Usermodel>> snapshot){

           if(!snapshot.hasData){
             return CircularProgressIndicator();
           }
           else {
             return ListView.builder(
                 itemCount: userList.length,
                 itemBuilder: (context, index) {
                   return Card(
                     child:
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                          Usablerow('Name',(snapshot.data![index].name.toString() )),
                           Usablerow('username',(snapshot.data![index].username.toString() )),
                           Usablerow('email',(snapshot.data![index].email.toString() )),
                           Usablerow('Address',(snapshot.data![index].address!.city.toString()

                           )),
                         ],
                       ),
                     ),
                   );
                 }
             );
           }
         },
       ))
        ],
      ),
    );
  }
}
class Usablerow extends StatelessWidget {
String title , value;
Usablerow(this.title , this.value);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),

        ],
      ),
    );
  }
}
