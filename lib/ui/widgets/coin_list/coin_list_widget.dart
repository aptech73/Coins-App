import 'package:flutter/material.dart';
import 'package:flutter_application/ui/widgets/coin_list/coin_list_model.dart';
import 'package:provider/provider.dart';

class CoinListWidget extends StatelessWidget {
  const CoinListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.select((CoinsListViewModel vm) => vm.state);
    return Scaffold(
      appBar: AppBar(title: const Text("Coins")),
      body: Stack(children: [
        if (model.isLoading) const Center(child: CircularProgressIndicator())
        else ListView.builder(
            itemCount: model.coins.length,
            itemBuilder: (BuildContext context, int index) {
              return _CoinListItemWidget(index: index);
            }),
      ],)
    );
  }
}

class _CoinListItemWidget extends StatelessWidget {
  final int index;

  const _CoinListItemWidget({
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CoinsListViewModel>();
    final coin = model.state.coins[index];
    return InkWell(
        onTap: () => model.onItemTap(context, index),
        child: SizedBox(
          height: 56,
          child: Padding (
            padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
            child: Row(
              children: [
                Image.network(coin.image),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(coin.name),
                      Text(coin.symbol.toUpperCase())
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text("\$ ${coin.currentPrice}"),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

