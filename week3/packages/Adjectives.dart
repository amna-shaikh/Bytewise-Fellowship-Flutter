import 'package:english_words/src/words/adjectives.dart' as Adjectivefile;
import 'package:flutter/material.dart';
class AdjectiveList extends StatefulWidget {
  const AdjectiveList({Key? key}) : super(key: key);
  @override
  _AdjectiveListState createState() => _AdjectiveListState();
}
class _AdjectiveListState extends State<AdjectiveList> {
  List<String> AdjectiveList = Adjectivefile.adjectives;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(title: Text(AdjectiveList[index] , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)));
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            );
          },
          itemCount: AdjectiveList.length)

    );
  }
}
