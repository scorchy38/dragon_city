import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
class CustomGoldenButton extends StatelessWidget {

  final String text;
  final TextStyle style;
  final double width;
  final double height;
  CustomGoldenButton({this.text,this.style,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeConfig.heightMultiplier * height,
      width: SizeConfig.widthMultiplier * width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10*SizeConfig.heightMultiplier)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.15,0.38,0.9],
            colors: [
          Color.fromRGBO(223,211,144,1),
          Color.fromRGBO(133,97,38,1),
          Color.fromRGBO(221,177,108,1),
        ]),
      ),
      child: Text(
        text,
      style: style,
      ),
    );
  }
}
