import 'values/values.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Commons {
  static snackBar(title, msg) {
    return Get.snackbar(title, msg,
        backgroundColor: Colors.green,
        titleText: Text(
          title,
          style: AppTextStyles.snackBarText,
        ),
        messageText: Text(
          msg,
          style: AppTextStyles.snackBarText,
        ));
  }

  static errorSnackBar(title, msg) {
    return Get.snackbar(title, msg,
        backgroundColor: Colors.red,
        titleText: Text(
          title,
          style: AppTextStyles.snackBarText,
        ),
        messageText: Text(
          msg,
          style: AppTextStyles.snackBarText,
        ));
  }

  Widget divider() => Container(
    height: 2,
    width: 50,
    color: Colors.black,
  );
}

const baseMargin = 8.0;

//* Horizontal Spacing
const Widget horizontalSpaceTiny = SizedBox(width: baseMargin / 2);
const Widget horizontalSpaceSmall = SizedBox(width: baseMargin);
const Widget horizontalSpaceRegular = SizedBox(width: baseMargin * 2);
const Widget horizontalSpaceMedium = SizedBox(width: baseMargin * 3);
const Widget horizontalSpaceLarge = SizedBox(width: baseMargin * 4);
const Widget bundleHorizontalSpacing = SizedBox(width: baseMargin * 1.5);

//* Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(height: baseMargin / 2);
const Widget verticalSpaceSmall = SizedBox(height: baseMargin);
const Widget verticalSpaceRegular = SizedBox(height: baseMargin * 2);
const Widget verticalSpaceMedium = SizedBox(height: baseMargin * 4);
const Widget verticalSpaceLarge = SizedBox(height: baseMargin * 8);
const Widget verticalSpaceExtraLarge = SizedBox(height: baseMargin * 10);
const Widget verticalLargeSpace = SizedBox(height: baseMargin * 15);
const Widget bundleVerticalSpacing = SizedBox(height: baseMargin * 1.5);
