import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';
class BorderedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(
          SizeConfig.heightMultiplier * 1.1,
        ))
      ),
    );
  }
}
