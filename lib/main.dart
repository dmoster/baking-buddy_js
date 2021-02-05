import 'dart:convert';

import 'package:baking_buddy/screens/calc/widgets/ingredientslist.dart';
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

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displayText = 20;

  String ingredientChosen;

  // Button handler
  Widget calcButton(String btnText, Color btnColor, Color textColor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculate(btnText);
        },
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 35,
            color: textColor,
          ),
        ),
        shape: CircleBorder(),
        color: btnColor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculator
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('data/ingredientsList.json'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else if (snapshot.data.isEmpty) {
            // Cry because your app is super broken
            return Container();
          } else {
            var ingredientsList = jsonDecode(snapshot.data.toString());
            IngredientsList ingredients =
                IngredientsList.fromList(ingredientsList);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        hint: Text(
                          'Choose an ingredient',
                          style: TextStyle(color: Colors.white),
                        ),
                        dropdownColor: Colors.grey[850],
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        underline: SizedBox(),
                        value: ingredientChosen,
                        onChanged: (newValue) {
                          setState(() {
                            ingredientChosen = newValue;
                          });
                        },
                        items: ingredients.names.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // Calculator display
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            text,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 100,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calcButton('AC', Colors.grey, Colors.black),
                      calcButton('+/-', Colors.grey, Colors.black),
                      calcButton('%', Colors.grey, Colors.black),
                      calcButton('tsp', Color(0xff0F4FA8), Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calcButton('7', Colors.grey[850], Colors.white),
                      calcButton('8', Colors.grey[850], Colors.white),
                      calcButton('9', Colors.grey[850], Colors.white),
                      calcButton('T', Color(0xff0F4FA8), Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calcButton('4', Colors.grey[850], Colors.white),
                      calcButton('5', Colors.grey[850], Colors.white),
                      calcButton('6', Colors.grey[850], Colors.white),
                      calcButton('c', Color(0xff0F4FA8), Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      calcButton('1', Colors.grey[850], Colors.white),
                      calcButton('2', Colors.grey[850], Colors.white),
                      calcButton('3', Colors.grey[850], Colors.white),
                      calcButton('oz', Colors.amber[700], Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                        onPressed: () {
                          calculate('0');
                        },
                        shape: StadiumBorder(),
                        child: Text(
                          '0',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        color: Colors.grey[850],
                      ),
                      calcButton('.', Colors.grey[850], Colors.white),
                      calcButton('g', Colors.amber[700], Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculate(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = subtract();
      } else if (preOpr == 'x') {
        finalResult = multiply();
      } else if (preOpr == '/') {
        finalResult = divide();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = subtract();
      } else if (opr == 'x') {
        finalResult = multiply();
      } else if (opr == '/') {
        finalResult = divide();
      }

      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String subtract() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String multiply() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String divide() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
      return result;
    }
  }
}
