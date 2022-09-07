import 'package:foodapp_heii/data/repository/popular_product_repo.dart';
import 'package:foodapp_heii/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> recommendedProductList = [];
  List<ProductModel>  get popularProductList => recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded=> _isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response =
    await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode == 200) {
      print("got products recommended");
      recommendedProductList = [];
      recommendedProductList.addAll(Product.fromJson(response.body).products);
      print(recommendedProductList);
      _isLoaded = true;
      update();
    }
    else {
      print('could not got products recommended');
    }
  }
}