import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/cart/views/parts/payment_success_view.dart';

import '../../../../../ui/app_colors.dart';
import '../../../../../ui/text_styles.dart';
import '../../../../../ui/ui_helpers.dart';

class LoadingPayment extends StatelessWidget {
  const LoadingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(() => PaymentSuccess());
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(KPrimaryColor),
            ),
            verticalSpaceMedium,
            Text(
              "Please Wait",
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
