import 'package:flutter/material.dart';
import 'view/onboardinglayoutview.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: onBoardingBody()),
    );
  }

  Widget onBoardingBody() => Container(
        child: OnBoardingLayoutView(),
      );
}
