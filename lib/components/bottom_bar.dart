import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegetable/app/modules/parts/cart_view.dart';
import 'package:vegetable/ui/app_colors.dart';
import 'package:vegetable/ui/constants.dart';
import 'package:vegetable/ui/text_styles.dart';

import '../app/routes/app_pages.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (Get.currentRoute != "/home") {
                Get.toNamed(Routes.HOME);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "${Constants.iconPath}home.png",
                    height: 24,
                    color: Get.currentRoute == '/home'
                        ? KPrimaryColor
                        : KDisabledColor,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Home',
                      style: bodyStyle.copyWith(
                        color: Get.currentRoute == '/home'
                            ? KPrimaryColor
                            : KDisabledColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Get.currentRoute != "/cart") {
                Get.to(CartView());
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "${Constants.iconPath}cart.png",
                    height: 24,
                    color: Get.currentRoute == '/cart'
                        ? KPrimaryColor
                        : KDisabledColor,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Cart',
                      style: bodyStyle.copyWith(
                        color: Get.currentRoute == '/cart'
                            ? KPrimaryColor
                            : KDisabledColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Get.currentRoute != "/favorite") {}
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "${Constants.iconPath}favorite.png",
                    height: 24,
                    color: Get.currentRoute == '/favorite'
                        ? KPrimaryColor
                        : KDisabledColor,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Favorite',
                      style: bodyStyle.copyWith(
                        color: Get.currentRoute == '/favorite'
                            ? KPrimaryColor
                            : KDisabledColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (Get.currentRoute != "/profile") {}
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "${Constants.iconPath}account.png",
                    height: 24,
                    color: Get.currentRoute == '/profile'
                        ? KPrimaryColor
                        : KDisabledColor,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Account',
                      style: bodyStyle.copyWith(
                        color: Get.currentRoute == '/Profile'
                            ? KPrimaryColor
                            : KDisabledColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
