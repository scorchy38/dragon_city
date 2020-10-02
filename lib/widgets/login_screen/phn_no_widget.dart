import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';
class PhoneNumberWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 5,
          width: SizeConfig.widthMultiplier* 80,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.white,
              )
            )
          ),
          child: Row(
            children: [
              Container(
                width: SizeConfig.widthMultiplier * 50,
                child: TextField(
                    keyboardType:  TextInputType.number,
                  style: normalTextStyle.copyWith(
                    fontSize: SizeConfig.textMultiplier * 2
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  onChanged: (value) {
                    //print(value);
                  },
                ),
              ),
              Expanded(child: Container(),),
              Icon(Icons.call,color: Colors.white,size: SizeConfig.imageSizeMultiplier * 6,)
            ],
          ),
        ),
        CustomGoldenButton(
          text: 'Get Code',
          style: normalTextStyle,
          width: 65,
          height: 5,
        )
      ],
    );
  }
}
