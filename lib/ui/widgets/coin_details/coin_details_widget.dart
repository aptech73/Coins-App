import 'package:flutter/material.dart';
import 'package:flutter_application/ui/widgets/coin_details/coin_details_model.dart';
import 'package:provider/provider.dart';

class CoinDetailsWidget extends StatelessWidget {
  const CoinDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CoinDetailsViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text(model.state.nameState)),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Stack(
          children: [
            if (model.state.isLoading) const Center(child: CircularProgressIndicator())
            else SingleChildScrollView(
              child: Column(
                    children: [
                      const Text("Description"),
                      Text(model.state.coinDetails!.description['en']!),
                    ],
                  )),
          ],
        ),
      )
    );
  }
}
