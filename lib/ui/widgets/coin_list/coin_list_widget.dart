import 'package:flutter/material.dart';
import 'package:flutter_application/ui/theme/app_colors.dart';
import 'package:flutter_application/ui/widgets/coin_list/coin_list_model.dart';
import 'package:google_fonts/google_fonts.dart';
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

    final priceTextStyle = GoogleFonts.getFont('Plus Jakarta Sans',
        textStyle: const TextStyle(
            color: AppColors.veryDarkGrey,
            fontWeight: FontWeight.w600,
            fontSize: 16
        )
    );
    final nameTextStyle = GoogleFonts.getFont('Plus Jakarta Sans',
        textStyle: const TextStyle(
            color: AppColors.veryDarkGrey,
            fontWeight: FontWeight.w500,
            fontSize: 16
        )
    );
    final symbolTextStyle = GoogleFonts.getFont('Plus Jakarta Sans',
        textStyle: const TextStyle(
            color: AppColors.veryDarkGrey,
            fontWeight: FontWeight.w400,
            fontSize: 14
        )
    );

    return InkWell(
        onTap: () => model.onItemTap(context, index),
        child: SizedBox(
          height: 60,
          child: Padding (
            padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
            child: Row(
              children: [
                Image.network(coin.image,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(coin.name,
                        style: nameTextStyle
                      ),
                      Text(coin.symbol.toUpperCase(),
                          style: symbolTextStyle
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text("\$ ${coin.currentPrice}",
                      style: priceTextStyle
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

