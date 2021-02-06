import 'package:baking_buddy/screens/calculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(BakingBuddy());

class BakingBuddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
