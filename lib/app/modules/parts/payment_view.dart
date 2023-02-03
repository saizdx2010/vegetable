import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/ui/constants.dart';
import 'package:vegetable/ui/ui_helpers.dart';

import '../../../../../components/buttons.dart';
import '../../../../../ui/app_colors.dart';
import '../../../../../ui/text_styles.dart';
import 'loading_payment_view.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

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
                Expanded(
                  child: GestureDetector(
                    child: PrimaryButton(),
                    onTap: () {
                      Get.to(() => LoadingPayment());
                    },
                  ),
                ),
              ],
            ),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              verticalSpaceLarge,
              Row(
                children: [
                  IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                    "Total Bill : Rp 2.500",
                    style: GoogleFonts.poppins(
                      textStyle: headingStyle.copyWith(
                          color: KTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // shop icon
                      Container(
                        child: Icon(
                          Icons.store,
                          size: 40,
                          color: KPrimaryColor,
                        ),
                      ),
                      horizontalSpaceMedium,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shop Name",
                            style: GoogleFonts.poppins(
                              textStyle: bodyStyle.copyWith(
                                  color: KTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "Address",
                            style: GoogleFonts.poppins(
                              textStyle: bodyStyle.copyWith(
                                  color: KTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Dash(
                        direction: Axis.vertical,
                        length: 40,
                        dashLength: 15,
                        dashColor: Colors.grey),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // shop icon
                      Container(
                        child: Icon(
                          Icons.store,
                          size: 40,
                          color: KPrimaryColor,
                        ),
                      ),
                      horizontalSpaceMedium,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sai Prashanth",
                            style: GoogleFonts.poppins(
                              textStyle: bodyStyle.copyWith(
                                  color: KTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            "Jl. Sei Blutu",
                            style: GoogleFonts.poppins(
                              textStyle: bodyStyle.copyWith(
                                  color: KTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              verticalSpaceMedium,
              // payment method
              Text(
                "Payment Method",
                style: GoogleFonts.poppins(
                  textStyle: headingStyle.copyWith(
                    color: KTextColor,
                    fontSize: 20,
                  ),
                ),
              ),
              verticalSpaceMedium,
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            '${Constants.paymentIconPath}paybuddy.png',
                          )),
                      horizontalSpaceSmall,
                      Text(
                        "PayBuddy",
                        style: GoogleFonts.poppins(
                          textStyle: bodyStyle.copyWith(
                              color: KTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                ],
              ),
              verticalSpaceSmall,
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            '${Constants.paymentIconPath}gopay.png',
                          )),
                      horizontalSpaceSmall,
                      Text(
                        "Gopay",
                        style: GoogleFonts.poppins(
                          textStyle: bodyStyle.copyWith(
                              color: KTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Spacer(),
                      Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            '${Constants.iconPath}success.png',
                          )),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                ],
              ),
              verticalSpaceSmall,
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            '${Constants.paymentIconPath}gopay.png',
                          )),
                      horizontalSpaceSmall,
                      Text(
                        "Credit Card",
                        style: GoogleFonts.poppins(
                          textStyle: bodyStyle.copyWith(
                              color: KTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
