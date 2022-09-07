import 'package:flutter/material.dart';
import 'package:foodapp_heii/controllers/popular_product_controller.dart';
import 'package:foodapp_heii/controllers/recommended_product_controller.dart';
import 'package:foodapp_heii/pagess/card/cart_page.dart';
import 'package:foodapp_heii/pagess/food/popular_food_detail.dart';
import 'package:foodapp_heii/pagess/food/recommended_food_detail.dart';
import 'package:foodapp_heii/pagess/home/food_page_body.dart';
import 'package:foodapp_heii/pagess/home/main_food_page.dart';
import 'package:foodapp_heii/routes/router_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:foodapp_heii/helper/dependencies.dart' as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
       home:  MainFoodPage(),
       initialRoute: RouteHelper.Initial,
       getPages: RouteHelper.routes,
    );

  }
}
