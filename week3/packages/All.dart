import 'package:english_words/src/words/all.dart' as Allfile;
import 'package:flutter/material.dart';
class AllList extends StatefulWidget {
  const AllList({Key? key}) : super(key: key);
  @override
  _AllListState createState() => _AllListState();
}
class _AllListState extends State<AllList> {
  List<String> AllList = Allfile.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(title: Text(AllList[index] , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)));
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            );
          },
          itemCount: AllList.length)

    );
  }
}
