import 'package:flutter/material.dart';
import 'package:foodapp_heii/utils/color.dart';
import 'package:foodapp_heii/utils/dimension.dart';
import 'package:foodapp_heii/widgets/big_text.dart';
import 'package:foodapp_heii/widgets/smail_text.dart';


import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print('current height is ' + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height30),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: 'VietNam', color: AppColors.mainColor,size: 25,),
                      Row(
                        children: [
                          SmallText(text: 'Ha Noi', color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)

                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      height: Dimensions.height45,
                      width: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.iconSize24,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: FoodPageBody(

                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
