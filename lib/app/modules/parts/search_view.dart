import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegetable/app/modules/home/views/parts/product_detail_view.dart';
import 'package:vegetable/app/routes/app_pages.dart';
import 'package:vegetable/models/vegetable_data.dart';
import 'package:vegetable/ui/ui_helpers.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';
import '../home/controllers/home_controller.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(
          init: HomeController(),
          dispose: (_) {
            controller.searchController.clear();
            allVegetables = controller.unfilteredVegetables;
          },
          initState: (_) {},
          builder: (_) {
            return Column(
              children: [
                verticalSpaceRegular,
                SearchBar(
                  controller: controller,
                ),
                ResultWidget(controller: controller),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  // controller
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon back
        Container(
          margin: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: KPrimaryColor,
            ),
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: KPrimaryColor,
              ),
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
                    controller: controller.searchController,
                    // search all vegetables
                    onChanged: (value) {
                      controller.searchVegetables(value);
                    },
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

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // grid view of search result
      child: GridView.builder(
        itemCount: allVegetables.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return allVegetables.isEmpty
              ? Center(
                  child: Text(
                    "No Search Result",
                    style: GoogleFonts.poppins(
                      textStyle: headingStyle.copyWith(
                        color: KTextColor,
                      ),
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      // click on image navigate to details page
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ProductDetailView(
                                  vegetables: allVegetables[index],
                                )),
                      );
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/${allVegetables[index].image}",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${allVegetables[index].name}",
                                style: GoogleFonts.poppins(
                                  textStyle: bodyStyle.copyWith(
                                    color: KTextColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: KSecondaryColor,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${allVegetables[index].rating}",
                                    style: GoogleFonts.poppins(
                                      textStyle: bodyStyle.copyWith(
                                        color: KTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Rp. ${allVegetables[index].price}",
                                style: GoogleFonts.poppins(
                                  textStyle: bodyStyle.copyWith(
                                    color: KTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
