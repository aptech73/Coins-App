import 'package:flutter/material.dart';

import '../../../domain/entities/coin_details.dart';
import '../../../domain/repository/network_repository.dart';

class CoinDetailsState {
  final String nameState;
  final bool isLoading;
  final CoinDetails? coinDetails;

  CoinDetailsState({
    required this.nameState,
    required this.isLoading,
    required this.coinDetails
  });
}

class CoinDetailsViewModel extends ChangeNotifier {
  final String coinId;
  final _networkRepository = NetworkRepository();

  var _state = CoinDetailsState(
      nameState: "Loading ...",
      isLoading: true,
      coinDetails: null
  );
  CoinDetailsState get state => _state;

  CoinDetailsViewModel({required this.coinId}) {
    getCoinDescriptionById(coinId);
  }

  void getCoinDescriptionById(String coinId) async {
    await _networkRepository.getCoinDescriptionById(coinId);
    _updateState();
  }

  void _updateState() {
    final _coinDetails = _networkRepository.coinDetails;

    _state = CoinDetailsState(
        nameState: _coinDetails.name,
        isLoading: false,
        coinDetails: _coinDetails
    );
    notifyListeners();
  }
}