import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';

const LinearGradient backgroundGradient = LinearGradient(
     begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromRGBO(235, 28, 34, 1),
      Color.fromRGBO(131, 1, 1, 0.88),
      Color.fromRGBO(207, 22, 26, 1),
    ]
);

 TextStyle shojuTextStyle = TextStyle(
  fontFamily: 'Shojumaru',
     fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: Colors.white,
  fontSize: SizeConfig.textMultiplier * 3.5
);

TextStyle alikeTextStyle = TextStyle(
    fontFamily: 'Alike',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: SizeConfig.textMultiplier * 1.7
);

TextStyle normalTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontSize: SizeConfig.textMultiplier * 1.8
);

const String leftDirection = 'left';
const String rightDirection = 'right';