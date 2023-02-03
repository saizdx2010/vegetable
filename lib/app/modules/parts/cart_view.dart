import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/parts/payment_view.dart';
import 'package:vegetable/app/routes/app_pages.dart';
import 'package:vegetable/models/cart.dart';

import '../../../components/buttons.dart';
import '../../../database/database.dart';
import '../../../ui/app_colors.dart';
import '../../../ui/constants.dart';
import '../../../ui/text_styles.dart';
import '../../../ui/ui_helpers.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double total = 0;
  @override
  void initState() {
    super.initState();
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
                    "Total Rp  ${total}",
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
                      Get.to(() => PaymentView());
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
              Get.toNamed(Routes.HOME);
            },
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
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
            verticalSpaceSmall,
            FutureBuilder<List<Cart>>(
              future: DatabaseHelper.instance.getCart(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
                if (!snapshot.hasData) {
                  total = 0;
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(KPrimaryColor),
                    ),
                  );
                }
                return snapshot.data!.isEmpty
                    ? Container(
                        height: Get.height * 0.8,
                        child: Center(
                            child: Text("Cart is empty",
                                style: GoogleFonts.poppins(
                                    textStyle: bodyStyle.copyWith(
                                        color: KTextColor)))))
                    : ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.map((cart) {
                          total = snapshot.data!.fold(
                            0,
                            (previousValue, element) =>
                                previousValue +
                                (element.price! * element.quantity!),
                          );
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  '${Constants.imagePath}${cart.image}',
                                  height: 120,
                                ),
                                horizontalSpaceSmall,
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${cart.name}",
                                            style: GoogleFonts.poppins(
                                              textStyle: bodyStyle.copyWith(
                                                  color: KTextColor,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              DatabaseHelper.instance
                                                  .deleteCart(cart.name!);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Rp. ${cart.price! * cart.quantity!}",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (cart.quantity! > 1) {
                                                cart.quantity =
                                                    cart.quantity! - 1;
                                                DatabaseHelper.instance
                                                    .updateCart(cart);
                                                setState(() {
                                                  total = snapshot.data!.fold(
                                                    0,
                                                    (previousValue, element) =>
                                                        previousValue +
                                                        (element.price! *
                                                            element.quantity!),
                                                  );
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: KTextColor),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                              ),
                                            ),
                                          ),
                                          horizontalSpaceSmall,
                                          Text(
                                            "${cart.quantity}",
                                            style: GoogleFonts.poppins(
                                              textStyle: bodyStyle.copyWith(
                                                  color: KTextColor,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          horizontalSpaceSmall,
                                          GestureDetector(
                                            onTap: () {
                                              cart.quantity =
                                                  cart.quantity! + 1;
                                              DatabaseHelper.instance
                                                  .updateCart(cart);
                                              setState(() {
                                                total = snapshot.data!.fold(
                                                  0,
                                                  (previousValue, element) =>
                                                      previousValue +
                                                      (element.price! *
                                                          element.quantity!),
                                                );
                                              });
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: KTextColor),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
