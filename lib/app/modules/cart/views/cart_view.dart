import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/cart/views/parts/payment_view.dart';
import 'package:vegetable/ui/ui_helpers.dart';

import '../../../../components/buttons.dart';
import '../../../../ui/app_colors.dart';
import '../../../../ui/constants.dart';
import '../../../../ui/text_styles.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Scaffold(
        persistentFooterButtons: [
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Row(
              // price
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Total Rp 2.500 ",
                    style: GoogleFonts.poppins(
                      textStyle: bodyStyle.copyWith(color: KTextColor),
                    ),
                  ),
                ),
                // add to cart
                Expanded(
                  child: GestureDetector(
                    child: PrimaryButton(),
                    onTap: () {
                      Get.to(() =>PaymentView());
                    },
                  ),
                ),
              ],
            ),
          )
        ],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: KPrimaryColor,
          toolbarHeight: 65,
          title: Text(
            'Shopping Cart',
            style: GoogleFonts.poppins(textStyle: bodyStyle),
          ),
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            // ios icon back
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          children: [
            verticalSpaceSmall,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.location_on,
                      ),
                    ),
                    Text(
                      "Medan, Indonesia",
                      style: GoogleFonts.poppins(
                        textStyle: bodyStyle.copyWith(color: KTextColor),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Change Address",
                    style: GoogleFonts.poppins(
                      textStyle: bodyStyle.copyWith(
                          color: Colors.blueAccent, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceLarge,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    '${Constants.imagePath}corriander.png',
                    height: 120,
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name",
                              style: GoogleFonts.poppins(
                                textStyle: bodyStyle.copyWith(
                                    color: KTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Rp. 2.500",
                              style: GoogleFonts.poppins(
                                textStyle: bodyStyle.copyWith(
                                    color: KTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // minus
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: KTextColor),
                              ),
                              child: Icon(
                                Icons.remove,
                              ),
                            ),
                            horizontalSpaceSmall,
                            Text(
                              "1",
                              style: GoogleFonts.poppins(
                                textStyle: bodyStyle.copyWith(
                                    color: KTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            horizontalSpaceSmall,
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: KTextColor),
                              ),
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
