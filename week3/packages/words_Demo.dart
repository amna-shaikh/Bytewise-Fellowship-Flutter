import 'dart:core';
import 'package:flutter/material.dart';
import 'Adjectives.dart';
import 'All.dart';
import 'Nouns.dart';

class wordsDemo extends StatefulWidget {
  @override
  State<wordsDemo> createState() => _wordsDemoState();
}
class _wordsDemoState extends State<wordsDemo> {
  List<String> title = ['Noun', 'Adjectives', 'All'];
  int currentIndex = 0;
  List<Widget> body = [
    NounList(),
    AdjectiveList(),
    AllList(),
  ];
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text(title[currentIndex]),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: title[0], icon: Icon(Icons.list)),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: title[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: title[2]),
        ],
      ),
    );
  }
}
