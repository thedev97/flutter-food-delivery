import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../res/routes/route_names.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getStorage.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero,() async{
      checkIfLogged();
    });
  }

  route1() =>  Get.offAllNamed(RouteName.HOME);

  route2() => Get.offAllNamed(RouteName.ONBOARDING);

  startTimer1() async {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, route1);
  }

  startTimer2() async {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, route2);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkIfLogged() {
    getStorage.read('isLogged') ? startTimer1() : startTimer2();
  }
}
