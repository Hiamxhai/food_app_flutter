import 'package:foodapp_heii/controllers/cart_controller.dart';
import 'package:foodapp_heii/controllers/popular_product_controller.dart';
import 'package:foodapp_heii/controllers/recommended_product_controller.dart';
import 'package:foodapp_heii/data/repository/cart_repo.dart';
import 'package:foodapp_heii/data/repository/popular_product_repo.dart';
import 'package:foodapp_heii/data/repository/recommended_product_repo.dart';
import 'package:foodapp_heii/utils/app_constans.dart';
import 'package:get/get.dart';
import '../data/api/api_client.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl:AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
