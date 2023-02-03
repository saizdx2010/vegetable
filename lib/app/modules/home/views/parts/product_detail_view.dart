import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/home/views/parts/added_to_cart_view.dart';
import 'package:vegetable/database/database.dart';
import 'package:vegetable/models/vegetable_data.dart';

import '../../../../../components/buttons.dart';
import '../../../../../models/cart.dart';
import '../../../../../ui/app_colors.dart';
import '../../../../../ui/constants.dart';
import '../../../../../ui/text_styles.dart';
import '../../controllers/home_controller.dart';

class ProductDetailView extends StatefulWidget {
  final VegetableData vegetables;
  ProductDetailView({super.key, required this.vegetables});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                    "Rp ${widget.vegetables.price} Per/Kg",
                    style: GoogleFonts.poppins(
                      textStyle: bodyStyle.copyWith(color: KTextColor),
                    ),
                  ),
                ),
                // add to cart
                Expanded(
                  child: GestureDetector(
                    child: PrimaryButton(),
                    onTap: () async {
                      await DatabaseHelper.instance.insertCart(
                        // insert to database
                        Cart(
                          name: widget.vegetables.name,
                          image: widget.vegetables.image,
                          price: widget.vegetables.price?.toDouble(),
                          quantity: 1,
                        ),
                      );
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
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  '${Constants.imagePath}${widget.vegetables.image}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "${widget.vegetables.name}",
                style: GoogleFonts.poppins(
                  textStyle: headingStyle.copyWith(color: KTextColor),
                ),
              ),
            ),
            // description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "${widget.vegetables.name} is a green vegetable that is part of the cabbage family. It is a good source of vitamin C and vitamin K. It is also a good source of fiber, folate, potassium, and vitamin A.",
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
