import 'dart:convert';
import 'package:flutter/services.dart';

/// Decode
// Map ingredientsList = jsonDecode(jsonString);
// var ingredient = Ingredient.fromJson(ingredientsList);

/// Encode
// String json = jsonEncoude(ingredient);

// import { ingredientsList } from '../data/ingredientsList.js';
// import { loadCalculator } from './view.js';

dynamic getIngredients(firstLetter) {
  String jsonData =
      rootBundle.loadString('data/ingredientsList.json') as String;
  Map ingredientsList = jsonDecode(jsonData);

  print(jsonData);

  return ingredientsList;
}

// export function getIngredientInfo(ingredientName) {
//   let ingredientVolume, ingredientOunces, ingredientGrams;

//   const ingredient = ingredientsList.filter(ingredient => {
//     return ingredient.name === ingredientName;
//   });

//   return ingredient[0];
// }
