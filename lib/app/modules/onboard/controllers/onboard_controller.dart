import 'package:get/get.dart';
import 'package:vegetable/app/routes/app_pages.dart';

class OnboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAndToNamed(Routes.HOME);
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
