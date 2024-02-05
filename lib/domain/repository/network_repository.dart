import 'package:flutter_application/domain/api/api_client.dart';
import 'package:flutter_application/domain/entities/coin_details.dart';

import '../entities/coin.dart';

class NetworkRepository {
  final _networkDataProvider = ApiClient();

  var _coins = List<Coin>.empty();
  List<Coin> get coins => _coins;
  
  var _coinDetails;
  CoinDetails get coinDetails => _coinDetails;

  Future<void> getCoinsList(String vsCurrency) async {
    _coins = await _networkDataProvider.getCoinList(vsCurrency: vsCurrency);
  }

  Future<void> getCoinDescriptionById(String id) async {
    _coinDetails = await _networkDataProvider.getCoinDescriptionById(id: id);
  }
}