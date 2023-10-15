import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/values/sizes.dart';
import '../../core/values/values.dart';
import '../../screens/onboarding/model/onboarding_model.dart';

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(sliderArrayList[index].sliderHeading,
              style: AppTextStyles.header),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            sliderArrayList[index].sliderSubHeading,
            style: AppTextStyles.subHeader,
          ),
          Lottie.asset(sliderArrayList[index].sliderImageUrl,
              height: sizeHeight / 1.75, width: sizeWidth),
        ],
      ),
    );
  }
}
