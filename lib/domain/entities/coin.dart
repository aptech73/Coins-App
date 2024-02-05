import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable()
class Coin {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'current_price')
  final double currentPrice;

  Coin({
    required this.id,
    required this.name,
    required this.image,
    required this.symbol,
    required this.currentPrice
  });

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
  Map<String, dynamic> toJson() => _$CoinToJson(this);
}