import 'package:baking_buddy/screens/calc/widgets/converter.dart';
import 'package:baking_buddy/screens/calc/widgets/ingredientslist.dart';

/// Get the converted amount of
dynamic getConvertedAmount(double valueToConvert, String fromType,
    String toType, String ingredientName, IngredientsList ingredients) {
  double toConversionFactor =
      getConversionFactor(toType, ingredients, ingredientName);
  double fromConversionFactor =
      getConversionFactor(fromType, ingredients, ingredientName);

  // Calculate, convert to string, and return volume measurement
  if (toType == 'volume') {
    return getVolumeStr(calculateConversion(
        fromConversionFactor, toConversionFactor, valueToConvert));
  } else {
    // Calculate and return ounces or grams measurement
    return calculateConversion(
        fromConversionFactor, toConversionFactor, valueToConvert);
  }
}

/// Get the conversion factor for the specified ingredient
double getConversionFactor(String measurementType, IngredientsList ingredients,
    String ingredientName) {
  if (measurementType == 'ounces') {
    return ingredients.list[ingredientName]['ounces'];
  } else if (measurementType == 'grams') {
    return ingredients.list[ingredientName]['grams'];
  } else {
    return ingredients.list[ingredientName]['volume'];
  }
}

/// Convert the amount from one unit to another
double calculateConversion(double fromConversionFactor,
    double toConversionFactor, double valueToConvert) {
  return toConversionFactor * valueToConvert / fromConversionFactor;
}
