///This is built in Animation in flutter
import 'package:flutter/material.dart';

class animate1 extends StatefulWidget {
  const animate1({Key? key}) : super(key: key);

  @override
  State<animate1> createState() => _animate1State();
}

class _animate1State extends State<animate1> {
  double opacity1 = 1;
  double margin1 = 1;
  double width1 = 200;
  Color color = Colors.yellow;
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(duration: Duration(seconds: 2),
        margin: EdgeInsets.all(margin1),
          width: width1,
          color: color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ()=> setState(() => margin1=100),
              child: Text('Animate margin')),
                ElevatedButton(onPressed: ()=> setState(() => width1=500),
                    child: Text('Animate width')),
                ElevatedButton(onPressed: ()=> setState(() => color=Colors.purple),
                    child: Text('Animate color')),
                ElevatedButton(onPressed: ()=> setState(() => opacity1=0),
                    child: Text('Animate opacity')),
        AnimatedOpacity(opacity: opacity1, duration: Duration(seconds: 2),
            child: Text('Hide opacity'))
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}
