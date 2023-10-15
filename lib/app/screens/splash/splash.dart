import 'package:get/get.dart';
import '../../core/values/values.dart';
import 'package:lottie/lottie.dart';
import '../../core/values/constants.dart';
import 'package:flutter/material.dart';
import 'controller/splash_controller.dart';

class Splash extends StatelessWidget {
   Splash({super.key});

  final SplashController splashController =
  Get.put(SplashController());

  @override
  Widget build(BuildContext context) => initScreen(context);

  initScreen(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Lottie.asset('assets/deliveroo.json'),
          ),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          Text(
            Constants.APP_TITLE,
            style: AppTextStyles.splashHeader,
          ),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          const CircularProgressIndicator(
            backgroundColor: Colors.black,
            strokeWidth: 1,
          )
        ],
      ),
    ),
  );
}
