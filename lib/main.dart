import 'dart:convert';
import 'package:baking_buddy/screens/calc/widgets/ingredientslist.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueChosen;
  List data;

  @override
  Widget build(BuildContext context) {
    //IngredientsList ingredients =
    //IngredientsList(context, 'data/ingredientsList.json');

    return Scaffold(
      appBar: AppBar(
        title: Text('Baking Buddy'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('data/ingredientsList.json'),
            builder: (context, snapshot) {
              var ingredientsList = jsonDecode(snapshot.data.toString());
              IngredientsList ingredients =
                  IngredientsList.fromList(ingredientsList);

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    hint: Text('Choose an ingredient'),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    value: valueChosen,
                    onChanged: (newValue) {
                      setState(() {
                        valueChosen = newValue;
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
              );
            },
          ),
        ),
      ),
    );
  }
}
