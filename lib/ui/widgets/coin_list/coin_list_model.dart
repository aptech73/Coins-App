import 'package:flutter/widgets.dart';
import 'package:flutter_application/domain/repository/network_repository.dart';
import 'package:flutter_application/ui/navigation/main_navigation_routes.dart';

import '../../../domain/entities/coin.dart';

class CoinsListViewModelState {
  final bool isLoading;
  final String currency;
  final List<Coin> coins;

  CoinsListViewModelState({
    required this.isLoading,
    required this.currency,
    required this.coins
  });
}

class CoinsListViewModel extends ChangeNotifier {
  final _networkRepository = NetworkRepository();

  var _state = CoinsListViewModelState(
      isLoading: true,
      currency: "usd",
      coins: List<Coin>.empty()
  );
  CoinsListViewModelState get state => _state;

  
  CoinsListViewModel() {
    getCoinsList("usd");
  }
  
  void getCoinsList(String vsCurrency) async {
    await _networkRepository.getCoinsList(vsCurrency);
    _updateState();
  }

  void onItemTap(BuildContext context, int index) {
    final id = state.coins[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRoutes.coinDetails,
      arguments: id
    );
  }

  void _updateState() {
    final coins = _networkRepository.coins;

    _state = CoinsListViewModelState(
        isLoading: false,
        currency: "usd",
        coins: coins
    );
    notifyListeners();
  }
}