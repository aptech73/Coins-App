// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetails _$CoinDetailsFromJson(Map<String, dynamic> json) => CoinDetails(
      id: json['id'] as String,
      name: json['name'] as String,
      description: Map<String, String>.from(json['description'] as Map),
    );

Map<String, dynamic> _$CoinDetailsToJson(CoinDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
