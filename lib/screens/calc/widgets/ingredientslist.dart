import 'dart:convert';
import 'package:flutter/cupertino.dart';

/// Decode
// Map ingredientsList = jsonDecode(jsonString);
// var ingredient = Ingredient.fromJson(ingredientsList);

/// Encode
// String json = jsonEncoude(ingredient);

// import { ingredientsList } from '../data/ingredientsList.js';
// import { loadCalculator } from './view.js';

class IngredientsList {
  var list;
  List<String> names;

  IngredientsList(BuildContext context, String jsonFilename) {
    this.names = List();
    initializeIngredientsList(context, jsonFilename);
  }

  IngredientsList.fromList(var list) {
    this.list = list;
    this.names = List();
    initializeIngredientNames();
  }

  void initializeIngredientsList(
      BuildContext context, String jsonFilename) async {
    String jsonData =
        await DefaultAssetBundle.of(context).loadString(jsonFilename);
    list = jsonDecode(jsonData);

    initializeIngredientNames();
  }

  void initializeIngredientNames() {
    for (var item in list) {
      names.add(item['name']);
    }
  }
}

// dynamic getIngredients(firstLetter) {
//   String jsonData =
//       rootBundle.loadString('data/ingredientsList.json') as String;
//   Map ingredientsList = jsonDecode(jsonData);

//   print(jsonData);

//   return ingredientsList;
// }

// export function getIngredientInfo(ingredientName) {
//   let ingredientVolume, ingredientOunces, ingredientGrams;

//   const ingredient = ingredientsList.filter(ingredient => {
//     return ingredient.name === ingredientName;
//   });

//   return ingredient[0];
// }
