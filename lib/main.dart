import 'dart:convert';
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
  List data;

  @override
  Widget build(BuildContext context) {
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
              List<String> ingredientNames =
                  getIngredientNames(ingredientsList);

              String dropdownValue = 'All-Purpose Flour';
              String newValue = '';

              return DropdownButton<String>(
                value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: ingredientNames
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 14)),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> getIngredientNames(ingredientsList) {
  var ingredientNames = List<String>();

  for (var item in ingredientsList) {
    ingredientNames.add(item['name']);
  }

  return ingredientNames;
}
