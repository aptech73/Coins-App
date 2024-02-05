import 'package:flutter/material.dart';
import 'package:flutter_application/ui/widgets/coin_details/coin_details_model.dart';
import 'package:flutter_application/ui/widgets/coin_details/coin_details_widget.dart';
import 'package:flutter_application/ui/widgets/coin_list/coin_list_model.dart';
import 'package:flutter_application/ui/widgets/coin_list/coin_list_widget.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeCoinListWidget() => ChangeNotifierProvider(
    create: (_) => CoinsListViewModel(),
    child: const CoinListWidget()
  );

  Widget makeCoinDetailsWidget(String id) => ChangeNotifierProvider(
    create: (_) => CoinDetailsViewModel(coinId: id),
    child: const CoinDetailsWidget(),
  );
}