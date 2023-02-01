import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/product_details/views/parts/added_to_cart_view.dart';
import 'package:vegetable/ui/app_colors.dart';
import 'package:vegetable/ui/text_styles.dart';

import '../../../../components/buttons.dart';
import '../../../../ui/constants.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
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
                    "Rp 2.500 Per/Kg",
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
                      Get.to(() => AddedToCartView());
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
            'Details',
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
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Image.asset(
                '${Constants.imagePath}brocolli_detail.png',
                fit: BoxFit.cover,
              ),
            ),
            // title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Brocolli",
                style: GoogleFonts.poppins(
                  textStyle: headingStyle.copyWith(color: KTextColor),
                ),
              ),
            ),
            // description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Broccoli is a green vegetable that is part of the cabbage family. It is a good source of vitamin C and vitamin K. It is also a good source of fiber, folate, potassium, and vitamin A.",
                style: GoogleFonts.poppins(
                  textStyle: bodyStyle.copyWith(color: KTextColor),
                ),
              ),
            ),
            // second title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Nutrition Facts",
                style: GoogleFonts.poppins(
                  textStyle: headingStyle.copyWith(color: KTextColor),
                ),
              ),
            ),
            // vitamins
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: KTextColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Fat",
                        style: GoogleFonts.poppins(
                          textStyle: bodyStyle.copyWith(color: KTextColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: KTextColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pottasium",
                        style: GoogleFonts.poppins(
                          textStyle: bodyStyle.copyWith(color: KTextColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: KTextColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Selenium",
                        style: GoogleFonts.poppins(
                          textStyle: bodyStyle.copyWith(color: KTextColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: KTextColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Zinc",
                        style: GoogleFonts.poppins(
                          textStyle: bodyStyle.copyWith(color: KTextColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

