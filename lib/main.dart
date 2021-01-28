import 'dart:convert';
import 'package:baking_buddy/screens/calc/widgets/ingredient.dart';

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

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('Name: ' + ingredientsList[index]['name']),
                        Text('Volume: ' + ingredientsList[index]['volume']),
                        Text('Ounces: ' + ingredientsList[index]['ounces']),
                        Text('Grams: ' + ingredientsList[index]['grams']),
                      ],
                    ),
                  );
                },
                itemCount: ingredientsList == null ? 0 : ingredientsList.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
