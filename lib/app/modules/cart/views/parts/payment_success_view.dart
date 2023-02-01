import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/home/views/home_view.dart';

import '../../../../../ui/app_colors.dart';
import '../../../../../ui/constants.dart';
import '../../../../../ui/text_styles.dart';
import '../../../../../ui/ui_helpers.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(() => HomeView());
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '${Constants.iconPath}success.png',
              height: 100,
            ),
            verticalSpaceMedium,
            Text(
              "Payment Successful",
              style: GoogleFonts.poppins(
                textStyle: bodyStyle.copyWith(color: KTextColor),
              ),
            ),
            Text(
              "Your Order is Booked",
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
