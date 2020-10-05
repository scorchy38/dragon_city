import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/border_container.dart';
class EditEmailId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 30,
      width: SizeConfig.widthMultiplier * 80,
      child: Column(
        children: [
          Text(
            'Enter Previous Email ID',
            style: normalTextStyle.copyWith(
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.textMultiplier * 2
            ),
          ),
          BorderedContainer(
              height: SizeConfig.heightMultiplier * 5.5,
              width: SizeConfig.widthMultiplier * 70,
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.heightMultiplier),
                child: Container()
              )
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2,),
          Text(
            'Enter New Email ID',
            style: normalTextStyle.copyWith(
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.textMultiplier * 2
            ),
          ),
          BorderedContainer(
              height: SizeConfig.heightMultiplier * 5.5,
              width: SizeConfig.widthMultiplier * 70,
              child: Container()
          ),
        ],
      ),
    );
  }
}
