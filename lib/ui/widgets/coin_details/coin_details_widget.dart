import 'package:flutter/material.dart';
import 'package:flutter_application/domain/entities/coin_details.dart';
import 'package:flutter_application/ui/widgets/coin_details/coin_details_model.dart';
import 'package:google_fonts/google_fonts.dart';
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
            else _CoinDetails(coinDetails: model.state.coinDetails!)
          ],
        ),
      )
    );
  }
}

class _CoinDetails extends StatelessWidget {
  final CoinDetails coinDetails;

  const _CoinDetails({
    required this.coinDetails
  });

  @override
  Widget build(BuildContext context) {

    final headerTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20
      ),
    );
    final mainTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16
      ),
    );


    return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Image.network(coinDetails.image['large']!, scale: 3),
            ),
            const SizedBox(height: 16),
            if (coinDetails.description['en']! != "") ... [
              Align(
                alignment: Alignment.topLeft,
                child: Text("Description", style: headerTextStyle),
              )
            ],
            const SizedBox(height: 8),
            Text(coinDetails.description['en']!, style: mainTextStyle)
      ],
    ));
  }
}

