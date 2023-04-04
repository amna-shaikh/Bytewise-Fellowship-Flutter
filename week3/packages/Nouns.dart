import 'package:english_words/src/words/nouns.dart' as Nouns;
import 'package:flutter/material.dart';
class NounList extends StatefulWidget {
  const NounList({Key? key}) : super(key: key);
  @override
  _NounListState createState() => _NounListState();
}
class _NounListState extends State<NounList> {
  List<String> NounList = Nouns.nouns;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(title: Text(NounList[index] , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)));
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
              );
            },
            itemCount: NounList.length)
        );
  }
}
