import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/ui/app_colors.dart';
import 'package:vegetable/ui/text_styles.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  final controller = Get.isRegistered()
      ? Get.find<OnboardController>()
      : Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Center(
        child: Text(
          'Vegetable',
          style: GoogleFonts.poppins(
            textStyle: titleStyle,
          ),
        ),
      ),
    );
  }
}
