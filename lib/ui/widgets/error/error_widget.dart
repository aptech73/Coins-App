import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const ErrorWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final textStyle = GoogleFonts.plusJakartaSans(
      textStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14
      )
    );
    final buttonTextStyle = GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 14
      )
    );

    return Column(children: [
      Text("Something went wrong :(\nShall we try again?", style: textStyle),
      FilledButton(onPressed: onTap, child: Text("Try again", style: buttonTextStyle))
    ],);
  }
}
