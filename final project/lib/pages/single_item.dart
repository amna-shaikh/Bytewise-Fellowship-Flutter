import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'comment_page.dart';

class SingleItem extends ConsumerStatefulWidget {
  String username;
  String title;
  String description;
  String imageURL;
  String? userProfile;

  SingleItem(
      {required this.username,
        required this.title,
        required this.description,
        required this.imageURL,
        this.userProfile});

  @override
  ConsumerState<SingleItem> createState() => _SingleItemState();
}
class _SingleItemState extends ConsumerState<SingleItem> {
  bool isfav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListTile(
            leading:ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: widget.userProfile!.contains("https")?
                Image.network(
                  widget.userProfile!,
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                ): Image.file(File(widget.userProfile!),
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                )
            ),
            title:Text(
              widget.username,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ) ,
          ),

          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Stack(
              children: [
                ClipRRect(
                //  borderRadius:  BorderRadius.circular(20),
                  child: widget.imageURL.contains("https") ?
                  Image(
                    image: NetworkImage(widget.imageURL),
                    width: MediaQuery.of(context).size.width,

                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )
                      : Image.file(File(widget.imageURL),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),

                ),
                /*  Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black87],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                )*/
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isfav = !isfav;
                    });
                  },
                  child: Icon(
                    isfav ? Icons.favorite  : Icons.favorite_border_outlined,
                    size: 30,
                    color: isfav ? Colors.red : Colors.white,

                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => commentPage()));
                    });

                  },
                  child:  Icon(
                    Icons.comment_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.share,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
              color: Colors.black45,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title : ${widget.title}' ,
                      style: const TextStyle(fontSize: 18, color: Colors.white , fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 15, color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                  ])),
        ]));
  }
}