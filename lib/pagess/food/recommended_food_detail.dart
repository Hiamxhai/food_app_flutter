import 'package:flutter/material.dart';
import 'package:foodapp_heii/controllers/popular_product_controller.dart';
import 'package:foodapp_heii/controllers/recommended_product_controller.dart';
import 'package:foodapp_heii/routes/router_helper.dart';
import 'package:foodapp_heii/utils/app_constans.dart';
import 'package:foodapp_heii/utils/color.dart';
import 'package:foodapp_heii/utils/dimension.dart';
import 'package:foodapp_heii/widgets/app_icon.dart';
import 'package:foodapp_heii/widgets/big_text.dart';
import 'package:foodapp_heii/widgets/exandable_text.widget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';

class RecommenededFoodDetail extends StatelessWidget {
  final int pageId;

  RecommenededFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>()
        .recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,
      Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.Initial);
                  },
                ),
                //AppIcon(icon: Icons.shopping_cart_outlined),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined,),
                        Get.find<PopularProductController>()
                            .totalItems>=1?
                        Positioned(
                          right:0,top :0,
                          child: AppIcon(icon: Icons.circle, size: 20,
                            iconColor: Colors.transparent,
                            backgroundColor: AppColors.mainColor,),
                        )
                            :Container(),
                        Get.find<PopularProductController>()
                            .totalItems>=1?
                        Positioned(
                          right: 3,top : 3,
                          child: BigText(text: Get.find<PopularProductController>()
                              .totalItems.toString(),
                            size: 12, color: Colors.white,
                          ),
                        )
                            :Container(),

                      ],
                    );
                  },
                )


              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                //margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),

                child: Center(
                    child: BigText(size : Dimensions.font26,text: product.name!)
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL+ product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: product.description!),
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder:(controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        iconColor: Colors.white,
                        backgroundColor : AppColors.mainColor,
                        icon: Icons.remove),
                  ),
                  BigText(
                    text: "\$ ${product.price} x ${controller.inCartItems}",
                    size: Dimensions.font26,
                    color: AppColors.mainBlackColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconColor: Colors.white,
                        backgroundColor : AppColors.mainColor,
                        icon: Icons.add),
                  )
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar  ,
              padding: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height30,
                  left: Dimensions.width20,
                  right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2)

                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        bottom: Dimensions.height20,
                        right:  Dimensions.width20,
                        left: Dimensions.width20
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child: Icon(
                      Icons.favorite,color: AppColors.mainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20
                      ),
                      child: BigText(text: '\$ ${product.price}! | Add to card',color: Colors.white,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
