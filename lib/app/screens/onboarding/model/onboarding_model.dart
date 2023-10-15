import '../../../core/values/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String? skipBtn;

  Slider(
      {required this.sliderImageUrl,
        required this.sliderHeading,
        required this.sliderSubHeading,
        this.skipBtn});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/order_food.json',
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_DESC_1,
      skipBtn: ""),
  Slider(
      sliderImageUrl: 'assets/cook.json',
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_DESC_2,
      skipBtn: Constants.SKIP),
  Slider(
      sliderImageUrl: 'assets/delivery.json',
      sliderHeading: Constants.SLIDER_HEADING_3,
      sliderSubHeading: Constants.SLIDER_DESC_3,
      skipBtn: Constants.SKIP),
];