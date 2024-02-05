import 'dart:convert';
import 'dart:io';

import 'package:flutter_application/domain/entities/coin_details.dart';

import '../entities/coin.dart';

class ApiClient {
  final _client = HttpClient();

  static const _host = "https://api.coingecko.com/api/v3";

  Future<List<Coin>> getCoinList({
    required String vsCurrency
  }) async {
    final url = Uri
        .parse("$_host/coins/markets?vs_currency=$vsCurrency");
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as List<dynamic>);
    final coins = json
        .map((dynamic e) => Coin.fromJson(e as Map<String, dynamic>))
        .toList();
    return coins;
  }

  Future<CoinDetails> getCoinDescriptionById({
    required String id
  }) async {
    final url = Uri.parse("$_host/coins/$id?localization=false");
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final coinDetails = CoinDetails.fromJson(json);
    return coinDetails;
  }
}