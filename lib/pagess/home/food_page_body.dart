import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_heii/controllers/popular_product_controller.dart';
import 'package:foodapp_heii/controllers/recommended_product_controller.dart';
import 'package:foodapp_heii/models/products_model.dart';
import 'package:foodapp_heii/pagess/food/popular_food_detail.dart';
import 'package:foodapp_heii/routes/router_helper.dart';
import 'package:foodapp_heii/utils/app_constans.dart';
import 'package:foodapp_heii/utils/color.dart';
import 'package:foodapp_heii/utils/dimension.dart';
import 'package:foodapp_heii/widgets/app_column.dart';
import 'package:foodapp_heii/widgets/big_text.dart';
import 'package:foodapp_heii/widgets/icon_and_texrt_widget.dart';
import 'package:foodapp_heii/widgets/smail_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageviewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  Widget build(BuildContext context) {
    return Column(

      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?Container(
            height: Dimensions.pageview,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        //dot
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length <= 0 ? 1 : popularProducts.popularProductList.length ,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        // Popular text
        SizedBox(
          height: Dimensions.height30,
        ),

        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: 'Food pairing',
                ),
              ),
              // List of food and images
            ],
          ),
        ),
       //recommeneded food
       GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
         return recommendedProduct.isLoaded?ListView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: recommendedProduct.recommendedProductList.length,
             itemBuilder: (context, index) {
               return GestureDetector(
                 onTap: () {
                    Get.toNamed(RouteHelper.getRecommendedFood(index));
                 },

                 child: Container(
                   margin: EdgeInsets.only(
                       left: Dimensions.width20,
                       right: Dimensions.width20,
                       bottom: Dimensions.height10,
                       top: Dimensions.height10),
                   child: Row(
                     children: [
                       // image section
                       Container(
                         height: Dimensions.ListViewImgSize,
                         width: Dimensions.ListViewImgSize,
                         decoration: BoxDecoration(
                             borderRadius:
                             BorderRadius.circular(Dimensions.radius20),
                             color: Colors.white38,
                             image: DecorationImage(
                                 fit: BoxFit.cover,
                                 image: NetworkImage(
                                     AppConstants.BASE_URL+ AppConstants.BASE_URL + recommendedProduct.recommendedProductList[index].img!  ))),
                       ),
                       //text container
                       Expanded(
                         child: Container(
                           height: Dimensions.ListViewTextConstSize,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(
                                 topRight: Radius.circular(Dimensions.radius20),
                                 bottomRight:
                                 Radius.circular(Dimensions.radius20)),
                             color: Colors.white,
                           ),
                           child: Padding(
                             padding: EdgeInsets.only(
                                 left: Dimensions.width10,
                                 right: Dimensions.width10),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 BigText(
                                   text: recommendedProduct.recommendedProductList[index].name!,
                                   color: Colors.black54,
                                 ),
                                 SizedBox(
                                   height: 1,
                                 ),
                                 SmallText(text: 'With Viet Nam characteristics'),
                                 SizedBox(
                                   height: 1,
                                 ),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     IconAndTextWidget(
                                         icon: Icons.circle_sharp,
                                         text: 'Nomail',
                                         iconColor: AppColors.iconColor1),
                                     IconAndTextWidget(
                                         icon: Icons.location_on,
                                         text: '1.7km',
                                         iconColor: AppColors.mainColor),
                                     IconAndTextWidget(
                                         icon: Icons.access_alarm_rounded,
                                         text: '32min',
                                         iconColor: AppColors.iconColor2),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               );
             }) : CircularProgressIndicator(
           color: AppColors.mainColor,
         );
       })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currenTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currenTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currenTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currenTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currenTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currenTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //showing the header
          GestureDetector(
          onTap: () {

          Get.toNamed(RouteHelper.getInitial());
          },
            child: Container(
              height: Dimensions.pageviewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL + AppConstants.UPLOAD_URL + popularProduct.img!))),
            ),
          ),
          //showing the body
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 10.0,
                        offset: Offset(0, 5)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10, left: 15, right: 15),
                child: AppColumn(text: popularProduct.name!,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
