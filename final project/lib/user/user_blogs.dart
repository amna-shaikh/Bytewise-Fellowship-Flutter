import 'dart:io';
import 'package:blogapp/helper/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../helper/list_notifier.dart';

class userBlogs extends ConsumerStatefulWidget {
  ConsumerState<userBlogs> createState() => _userBlogsState();
}

class _userBlogsState extends ConsumerState<userBlogs> {
  //static List<blogModel> userList = [];
  @override
  Widget build(BuildContext context) {
    final userlist = ref.read(userList);
    return Scaffold(
    backgroundColor: Colors.black87,
    appBar: AppBar(
    elevation: 0.0,
    backgroundColor: Colors.black87,
    title: const Text(
    "My Blogs",
    style: TextStyle(fontSize: 25, color: Colors.white),
    ),
    centerTitle: true,
    ),
      body: ListView.builder(
          shrinkWrap: true, // new line
          physics: const NeverScrollableScrollPhysics(), // new line
          scrollDirection: Axis.vertical,
          itemCount: userlist.length,
          itemBuilder: (BuildContext context, int index) {
            if(userlist.length > 0 ) {
              return Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    ListTile(
                      leading:  ClipRRect(
                        borderRadius:  BorderRadius.circular(50),
                        child: Image.file(File(userlist[index].userProfile),
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title:Text(
                        userlist[index].username,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ) ,
                      trailing: IconButton(onPressed: () {
                        setState(() {
                          userlist.removeAt(index);
                        });

                      }, icon: Icon(Icons.delete, size: 25,) , color: Colors.white,),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                          ClipRRect(
                              borderRadius:  BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)
                              ),
                              child:
                              Image.file(File(userlist[index].imageURL),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              )
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        color: Colors.black87,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userlist[index].title,
                                style: const TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                userlist[index].description,
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ])),
                  ]));
            }
          },
      ),
    );

  }
}
class Singleblog extends ConsumerWidget {
  String username;
  String title;
  String description;
  String imageURL;
  String userProfile;

  Singleblog({required this.username,
    required this.title,
    required this.description,
    required this.imageURL,
   required this.userProfile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userprofile = ref.watch(UserNameProvider);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          leading:  ClipRRect(
            borderRadius:  BorderRadius.circular(50),
            child: Image.file(File(userprofile),
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            //  width: MediaQuery.of(context).size.width,
             // filterQuality: FilterQuality.high,
            ),

          ),
          title:Text(
            username,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ) ,
        ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 300,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.circular(50),
                  child:
                  Image.file(File(imageURL),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,

                  )
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ])),
        ]));
  }
}