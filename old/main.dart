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
  String ingredientChosen;
  String measurementChosen;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //IngredientsList ingredients =
    //IngredientsList(context, 'data/ingredientsList.json');

    return Scaffold(
      appBar: AppBar(
        title: Text('Baking Buddy'),
      ),
      body: Container(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('data/ingredientsList.json'),
          builder: (context, snapshot) {
            var ingredientsList = jsonDecode(snapshot.data.toString());
            IngredientsList ingredients =
                IngredientsList.fromList(ingredientsList);

            List measurementTypes = [
              'cups',
              'tablespoons',
              'teaspoons',
              'ounces',
              'grams'
            ];

            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Ingredient',
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 16),
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
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: FormField<double>(
                                builder: (FormFieldState<double> state) {
                                  return TextField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(fontSize: 16),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Amount',
                                      alignLabelWithHint: true,
                                    ),
                                  );
                                },
                                onSaved: (double initialValue) {},
                                validator: (double val) {},
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButtonFormField(
                                dropdownColor: Colors.white,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 36,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Measurement',
                                ),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                value: measurementChosen,
                                onChanged: (newValue) {
                                  setState(() {
                                    measurementChosen = newValue;
                                  });
                                },
                                items: measurementTypes.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
