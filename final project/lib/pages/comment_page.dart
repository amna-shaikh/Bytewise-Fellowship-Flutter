
import 'dart:io';
import 'package:blogapp/helper/notifier.dart';
import 'package:blogapp/models/commentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class commentPage extends ConsumerStatefulWidget {
  const commentPage({Key? key}) : super(key: key);

  @override
  ConsumerState<commentPage> createState() => _commentPageState();
}

class _commentPageState extends ConsumerState<commentPage> {
  List<commentModel> commentlist = [
    commentModel(
      username: "amnashaikh121",
      userProfile: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      comment: "wow beautiful view"
    )
  ];

  Widget buildList() {
    return ListView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: commentlist.length,
        itemBuilder: (context, index) {
           return ListTile(
              subtitle: Text(commentlist[index].comment, style: TextStyle(color: Colors.white),),
              title: Text(commentlist[index].username, style: TextStyle(color: Colors.white)),
              leading: ClipRRect(
                  borderRadius:  BorderRadius.circular(50),
                  child: commentlist[index].userProfile.contains("https") ?
                  Image(
                    image: NetworkImage(commentlist[index].userProfile),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )
                      : Image.file(File(commentlist[index].userProfile),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
              ),
              trailing: Icon(Icons.favorite_border),
            );

        });
  }

  
  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileUrlProvider);
    final username = ref.watch(UserNameProvider);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        title: Text("Comments", style: TextStyle(color: Colors.white, fontSize: 20),),
        centerTitle: true,
      ),
      body:
      Column(
          children: [
            Expanded(child:buildList() ),
           Padding(
             padding: EdgeInsets.all(8),
             child: TextField(
               style:TextStyle(color: Colors.white) ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Add comment"),
                    labelStyle: TextStyle(color: Colors.white)
                  ),
                  onSubmitted: (String value){

setState(() {
  commentlist.add(
      commentModel(
          userProfile: profile.isEmpty ? "https://www.seekpng.com/png/small/41-410093_circled-user-icon-user-profile-icon-png.png" : profile,
          username: username,
          comment: value
      )
  );

});
                  },
                ),
           ),

          ],
        ),

    );
  }
}
