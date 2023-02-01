import 'package:get/get.dart';
import 'package:vegetable/app/modules/home/views/home_view.dart';

class OnboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(() => HomeView(), transition: Transition.fade);
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
