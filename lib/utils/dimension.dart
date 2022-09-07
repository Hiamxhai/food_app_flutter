import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 816 / 220 = 3.71
  static double pageview = screenHeight / 2.64;
  static double pageviewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.83;

  // dynamic height pading and margin

  static double height10 = screenHeight/ 84.4;
  static double height15 = screenHeight/ 56.27;
  static double height20 = screenHeight/ 42.2;
  static double height30 = screenHeight/ 29.13;
  static double height45 = screenHeight/ 18.76;


  //dynamic width
  static double width10 = screenHeight/ 84.4;
  static double width15 = screenHeight/ 56.27;
  static double width20 = screenHeight/ 42.2;
  static double width30 = screenHeight/ 28.13;

  //font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.4;

  //radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 29.13;
  static double radius30 = screenHeight / 42.2;

  //icon Size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight/ 52.75;

  // list view size 390
  static double ListViewImgSize = screenWidth / 3.25;
  static double ListViewTextConstSize = screenWidth / 3.9;


  // popular food
  static double popularFoodImgSize = screenHeight / 2.41;

  // bottom height
  static double bottomHeightBar = screenHeight / 7.03;

}