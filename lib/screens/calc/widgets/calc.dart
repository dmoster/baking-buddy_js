import 'converter.dart';
import 'ingredient.dart';

/// Get the converted amount of
dynamic getConvertedAmount(double valueToConvert, String fromType,
    String toType, Ingredient ingredient) {
  double toConversionFactor = getConversionFactor(toType, ingredient);
  double fromConversionFactor = getConversionFactor(fromType, ingredient);

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
double getConversionFactor(String measurementType, Ingredient ingredient) {
  if (measurementType == 'ounces') {
    return ingredient.ounces;
  } else if (measurementType == 'grams') {
    return ingredient.grams;
  } else {
    return ingredient.volume;
  }
}

/// Convert the amount from one unit to another
double calculateConversion(double fromConversionFactor,
    double toConversionFactor, double valueToConvert) {
  return toConversionFactor * valueToConvert / fromConversionFactor;
}
