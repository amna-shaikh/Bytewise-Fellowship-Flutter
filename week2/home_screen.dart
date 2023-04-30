
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/Postmodel.dart';
class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}
class _home_screenState extends State<home_screen> {
  List<Postmodel> postlist = [];
  Future<List<Postmodel>> getpostapi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postlist.clear();
  for(Map i in data){
    postlist.add(Postmodel.fromJson(i)); }
    return postlist;

    }
    else {
return postlist;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Column(
        children: [
        Expanded(
          child: FutureBuilder(
              future: getpostapi(),
                builder: (context , snapshot){
                if(!snapshot.hasData){
                  return Text('loading');
                }else {
                  return  ListView.builder(
                      itemCount: postlist.length,
                  itemBuilder: (context  , index){
          return Padding(
            padding: EdgeInsets.all(8),
            child : Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Title'),
            Text(postlist[index].title.toString()),
            SizedBox(height: 5,),
            Text('Description '),
                Text(postlist[index].body.toString())
              ],),
            ),
          );
    });
            }},
            ),
        ),
      ],),
    );
  }
}
