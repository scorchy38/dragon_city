import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';

import '../constants.dart';

class ShopViewWidget extends StatelessWidget {
 final String imagePath;
  final String shopTitle;
  final String numbers;

  ShopViewWidget({this.imagePath,this.shopTitle, this.numbers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 17,
      width: SizeConfig.heightMultiplier * 17,
      child: Stack(
        alignment: Alignment(0, 0.8),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.heightMultiplier),
            ),
            child: Image.asset(
              imagePath,
              height: SizeConfig.heightMultiplier * 15,
              width: SizeConfig.heightMultiplier * 15,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: SizeConfig.heightMultiplier * 2,
            width: SizeConfig.widthMultiplier * 25,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    shopTitle,
                    style: normalTextStyle.copyWith(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  VerticalDivider(thickness: 1, width: 1, color: Colors.white),
                  Text(
                    numbers,
                    style: normalTextStyle.copyWith(
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
