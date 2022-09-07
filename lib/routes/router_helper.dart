import 'package:foodapp_heii/pagess/food/popular_food_detail.dart';
import 'package:foodapp_heii/pagess/food/recommended_food_detail.dart';
import 'package:foodapp_heii/pagess/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String Initial ="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";

  static String getInitial()=>'/';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: "/", page: () => MainFoodPage()),

    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      return RecommenededFoodDetail(pageId: int.parse(pageId!));
    },
        transition: Transition.fadeIn
    ),
  ];
}