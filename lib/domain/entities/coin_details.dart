import 'package:json_annotation/json_annotation.dart';

part 'coin_details.g.dart';

@JsonSerializable()
class CoinDetails {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final Map<String, String> description;


  CoinDetails ({
    required this.id,
    required this.name,
    required this.description
  });

  factory CoinDetails.fromJson(Map<String, dynamic> json) => _$CoinDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CoinDetailsToJson(this);
}