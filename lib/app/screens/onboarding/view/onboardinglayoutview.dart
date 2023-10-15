import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/values/values.dart';
import '../../../res/widgets/button.dart';
import '../../../core/values/sizes.dart';
import '../../../core/values/constants.dart';
import '../../../res/widgets/slide_dot.dart';
import '../model/onboarding_model.dart';
import '../../../res/widgets/slider_item.dart';
import '../controller/onboardingcontroller.dart';

class OnBoardingLayoutView extends StatelessWidget {
  OnBoardingLayoutView({super.key});

  final OnboardingController onboardingController =
      Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) => SliderLayout();

  Widget SliderLayout() => Container(
          child: Obx(
        () => Stack(
          children: <Widget>[pagination(), topView(), bottomView()],
        ),
      ));

  Widget pagination() => Padding(
        padding: EdgeInsets.only(top: sizeHeight * 0.15),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: onboardingController.pageController,
          onPageChanged: onboardingController.onPageChanged,
          itemCount: sliderArrayList.length,
          itemBuilder: (ctx, i) => SlideItem(i),
        ),
      );

  Widget topView() => Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0, top: sizeHeight * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  onboardingController.currentPage.value ==
                          sliderArrayList.length - 3
                      ? Container()
                      : IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black54,
                            size: 20.0,
                          ),
                        ),
                  Text(
                    Constants.SKIP,
                    style: AppTextStyles.skipButton,
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget bottomView() => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < sliderArrayList.length; i++)
                    if (i == onboardingController.currentPage.value)
                      SlideDots(true)
                    else
                      SlideDots(false)
                ],
              ),
              Button(
                height: 65.0,
                width: 65.0,
                widget: Text(
                  onboardingController.currentPage.value ==
                      sliderArrayList.length - 1
                      ? Constants.GET_STARTED
                      : Constants.NEXT,
                  style: AppTextStyles.onboardingButton,
                ),
                onPressed: () {
                  if (onboardingController.currentPage.value ==
                      sliderArrayList.length - 1) {
                    Get.toNamed('/auth');
                  }
                  onboardingController.pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
              )
            ],
          ),
        ),
      );
}
