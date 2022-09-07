import 'package:flutter/material.dart';
import 'package:foodapp_heii/utils/color.dart';
import 'package:foodapp_heii/utils/dimension.dart';
import 'package:foodapp_heii/widgets/big_text.dart';
import 'package:foodapp_heii/widgets/smail_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key,required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight = 5.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt() + 100);
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }
    else {
      firstHalf = widget.text;
      secondHalf = " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: AppColors.paraColor,size: Dimensions.font16,height : 1.8,text: firstHalf):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"..."):(firstHalf + secondHalf),size: 16,color: AppColors.paraColor,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                BigText(text: 'Show more',color: AppColors.mainColor,size: 15,),
                Icon(hiddenText? Icons.arrow_drop_down : Icons.arrow_drop_up,color: AppColors.mainColor,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
