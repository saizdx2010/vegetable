import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegetable/models/vegetable_data.dart';
import 'package:vegetable/models/vegetables.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  List<Vegetables> vegetables = VegetablesList;

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

  // search
  void search() {
    if (searchController.text.isNotEmpty) {
      List<VegetableData> searchVegetables = [];
      allVegetables.forEach((element) {
        if (element.name!
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          searchVegetables.add(element);
        }
      });
      allVegetables = searchVegetables;
    } else if (searchController.text.isEmpty) {
      allVegetables = allVegetables;
    }
    update();
  }


  // payment method
  void changePaymentMethod(String method) {
    paymentMethod = method;
    update();
  }
}
