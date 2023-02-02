import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vegetable/models/vegetables.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  List<Vegetables> vegetables = VegetablesList;

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
}
