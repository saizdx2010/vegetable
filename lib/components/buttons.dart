import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui/app_colors.dart';
import '../ui/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    this.buttonText,
  }) : super(key: key);

  String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: KPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "${buttonText ?? "Button"}",
          style: GoogleFonts.poppins(
            textStyle: bodyStyle.copyWith(color: KTextLightColor),
          ),
        ),
      ),
    );
  }
}
