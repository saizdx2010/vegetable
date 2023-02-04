import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/home/views/parts/product_detail_view.dart';
import 'package:vegetable/app/modules/parts/search_view.dart';
import 'package:vegetable/components/bottom_bar.dart';
import 'package:vegetable/ui/app_colors.dart';
import 'package:vegetable/ui/ui_helpers.dart';

import '../../../../ui/constants.dart';
import '../../../../ui/text_styles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        bottomNavigationBar: BottomBar(),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (_) {
              return Column(
                children: [
                  HeaderWidget(),
                  verticalSpaceMedium,
                  TabBar(
                    controller: controller.tabController,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    indicatorColor: KSecondaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      createTabBar("Vegetables"),
                      createTabBar("Fruits"),
                      createTabBar("Dry Fruits"),
                    ],
                  ),
                  verticalSpaceMedium,
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        // Vegetable List
                        VegetableList(controller: controller),
                        Center(
                            child: Text(
                          "No Fruits",
                          style: GoogleFonts.poppins(
                            textStyle: headingStyle.copyWith(
                                fontSize: 18, color: KTextColor),
                          ),
                        )),
                        Center(
                            child: Text(
                          "No Dry Fruits",
                          style: GoogleFonts.poppins(
                            textStyle: headingStyle.copyWith(
                                fontSize: 18, color: KTextColor),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 120,
          color: KPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vegetable",
                  style: GoogleFonts.poppins(
                    textStyle: headingStyle,
                  ),
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // input for search
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => SearchView());
          },
          child: Container(
            margin: EdgeInsets.only(top: 90, left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.search,
                    color: KPrimaryColor,
                  ),
                ),
                Expanded(
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: bodyStyle.copyWith(
                          color: KTextColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VegetableList extends StatelessWidget {
  const VegetableList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: controller.vegetables.length,
      itemBuilder: (context, index) {
        final vegetablesList = controller.vegetables[index];
        return Container(
          height: 270,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vegetablesList.title,
                style: GoogleFonts.poppins(
                  textStyle: bodyStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: KTextColor,
                  ),
                ),
              ),
              Text(
                vegetablesList.subTitle,
                style: GoogleFonts.poppins(
                  textStyle: bodyStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KTextColor.withOpacity(0.5),
                  ),
                ),
              ),
              verticalSpaceRegular,
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: vegetablesList.vegetables.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final singleVegetables = vegetablesList.vegetables[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailView(
                                vegetables: singleVegetables)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16),
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  '${Constants.imagePath}${singleVegetables.image}',
                                  width: 150,
                                ),
                                // favorite icon with white background
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      // toggle favorite
                                      controller
                                          .toggleFavorite(singleVegetables);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        color:
                                            singleVegetables.isFavorite == true
                                                ? Colors.pink
                                                : Colors.grey,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceTiny,
                            Text(
                              "${singleVegetables.name}",
                              style: GoogleFonts.poppins(
                                textStyle: bodyStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: KTextColor,
                                ),
                              ),
                            ),
                            verticalSpaceTiny,
                            Row(
                              children: [
                                Text(
                                  "${singleVegetables.rating}",
                                  style: GoogleFonts.poppins(
                                    textStyle: bodyStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: KTextColor,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: KSecondaryColor,
                                  size: 12,
                                ),
                              ],
                            ),
                            verticalSpaceTiny,
                            Text(
                              "Rp ${singleVegetables.price} \Kg",
                              style: GoogleFonts.poppins(
                                textStyle: bodyStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: KTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Widget createTabBar(String label) => Container(
      height: 32,
      decoration: BoxDecoration(
        // conditional color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text("$label",
              style: GoogleFonts.poppins(
                textStyle: bodyStyle.copyWith(
                  color: KSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ))),
    );
