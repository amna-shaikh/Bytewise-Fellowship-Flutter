import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class photo_example extends StatefulWidget {
  const photo_example({Key? key}) : super(key: key);

  @override
  State<photo_example> createState() => _photo_exampleState();
}

class _photo_exampleState extends State<photo_example> {
  @override
  List<Photos> photoslist = [];
  
  Future<List<Photos>> getphotos()async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
   var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200) {
      for(Map i in data){
        Photos photos = Photos( i['title'], i['url'] , i['id']);
        photoslist.add(photos);
      }
      return photoslist;
  }
    else {
      return photoslist;
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          FutureBuilder(
          future: getphotos(),
              builder: (context ,AsyncSnapshot<List<Photos>> snapshot){
               return ListView.builder(
                 itemCount: photoslist.length,
                 itemBuilder: (context , index){
                   return ListTile(
                     leading: CircleAvatar(
                       backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                     ),
                     subtitle:Text(snapshot.data![index].id.toString()) ,
                     title: Text(snapshot.data![index].title.toString()),
                   );
                 },
               );
              }
          )
        ],
      ),
    );
  }
}
class Photos {
  String title , url;
  int id;
  Photos(this.title , this.url , this.id);
}
