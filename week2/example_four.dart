import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  var data;
  Future<void> getuserapi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }
    else {}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body:Column(
        children: [Expanded(
            child: FutureBuilder(
              future: getuserapi(),
                builder: (context , snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  {
                    return Text('loading');
                  }

                else {
                  return ListView.builder(
itemCount: data.length,
                      itemBuilder: (context , index){
                        return Card(
                          child: Column(
                            children: [
                              Usablerow('name', data[index]['name'].toString()),
                              Usablerow('username', data[index]['username'].toString()),
                              Usablerow('address', data[index]['address']['street'].toString()),
                              Usablerow('name', data[index]['address']['geo']['lat'].toString()),



                            ],
                          ),
                        );
                  }
                  );
                }
                })


        )
        ],
      )
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
