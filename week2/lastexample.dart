
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/productmodel.dart';

class lastexample extends StatefulWidget {
  const lastexample({Key? key}) : super(key: key);

  @override
  State<lastexample> createState() => _lastexampleState();
}

class _lastexampleState extends State<lastexample> {
  Future<Productmodel> getproduct () async {

    final response = await http.get(Uri.parse('https://webhook.site/1ad7f7f2-1c55-4f4c-9aa6-cd36b35db158'));
  var data = jsonDecode(response.body.toString());
  if(response.statusCode == 200){
    return Productmodel.fromJson(data);
  }
  else{
    return Productmodel.fromJson(data);
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(child: FutureBuilder<Productmodel>(
              future: getproduct(),
              builder: (context , snapshot){
                if(!snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            ListTile(
                              title: Text(snapshot.data!.data![index].shop!.name.toString()),
                              subtitle: Text(snapshot.data!.data![index].shop!.shopemail.toString()),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
                              ),
                            ),
                          Container(
                        height: MediaQuery.of(context).size.height *.3,
                            width: MediaQuery.of(context).size.height *.1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.data![index].images!.length,
    itemBuilder: (context, position) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: MediaQuery.of(context).size.height *.25,
            width: MediaQuery.of(context).size.height *.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(snapshot.data!.data![index].images![position].url.toString())
              )
            ),
          ),
        );








    })
                          ),
                            Icon(snapshot.data!.data![index].inWishlist == false ? Icons.favorite : Icons.favorite_outline)
                        ],);
                      }
                  );
                }
                else{
                  return Text("loading");
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
