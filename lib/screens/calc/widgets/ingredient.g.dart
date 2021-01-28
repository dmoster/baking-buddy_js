// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    json['name'] as String,
    (json['volume'] as num)?.toDouble(),
    (json['ounces'] as num)?.toDouble(),
    (json['grams'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'volume': instance.volume,
      'ounces': instance.ounces,
      'grams': instance.grams,
    };
