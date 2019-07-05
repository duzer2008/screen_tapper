import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: TapPage(),
    );
}

class TapPage extends StatefulWidget {
  @override
  _TapPageState createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  int tapCounter = 15;

  @override
  Widget build(BuildContext context) {
    Color firstGradient = Colors.primaries[++tapCounter % Colors.primaries.length];
    Color secondGradient = Colors.primaries[--tapCounter % Colors.primaries.length];
    return GestureDetector(
      onTap: _changeColorCounter,
      child: Scaffold(
        body: AnimatedContainer(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [firstGradient,secondGradient],
                  tileMode: TileMode.mirror
              ),
          ),
          duration: Duration(seconds: 1),
          child: Center(child: Text(
            "Hey there",
            style: TextStyle(
              fontSize: 24,
              color: Colors.accents[tapCounter % Colors.accents.length].shade400,
            ),
          )),
        ),
      ),
    );
  }

  _changeColorCounter(){
    setState(() {
      tapCounter++;
    });
  }
}