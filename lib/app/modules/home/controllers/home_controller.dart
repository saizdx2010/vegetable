import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegetable/models/vegetable_data.dart';
import 'package:vegetable/models/vegetables.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  List<Vegetables> vegetables = VegetablesList;

  List<VegetableData> unfilteredVegetables = allVegetables;

  // search
  TextEditingController searchController = TextEditingController();

  double totalPrice = 0;

  String paymentMethod = 'Gopay';
  String activePaymentMethod = 'Gopay';

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 3);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // payment method
  void changePaymentMethod(String method) {
    paymentMethod = method;
    update();
  }

  // toggle favorite
  void toggleFavorite(VegetableData vegetable) {
    // vegetable.isFavorite = vegetable.isFavorite == false;
    vegetable.isFavorite == false
        ? vegetable.isFavorite = true
        : vegetable.isFavorite = false;
    update();
  }

  // create search and when search is empty show all vegetables
  void searchVegetables(String query) {
    if (query.isNotEmpty) {
      allVegetables = allVegetables
          .where((element) =>
              element.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      allVegetables = unfilteredVegetables;
    }
    update();
  }
}
