import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/ui/app_colors.dart';
import 'package:vegetable/ui/text_styles.dart';
import 'package:vegetable/ui/ui_helpers.dart';

import '../../../../../ui/constants.dart';

class AddedToCartView extends StatelessWidget {
  const AddedToCartView({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '${Constants.iconPath}shopping_cart.png',
              height: 100,
            ),
            verticalSpaceMedium,
            Text(
              "Added to cart",
              style: GoogleFonts.poppins(
                textStyle: bodyStyle.copyWith(color: KTextColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
