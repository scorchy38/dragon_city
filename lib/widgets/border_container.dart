import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';
class BorderedContainer extends StatelessWidget {

  final double height;
  final double width;
  final Widget child;

  BorderedContainer({
    this.height,
    this.width,
    this.child
});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * height,
      width: SizeConfig.widthMultiplier * width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(216,216,216,1),
          width: 1
        ),
        borderRadius: BorderRadius.all(Radius.circular(
          SizeConfig.heightMultiplier * 1.1,
        ),
        )
      ),
      child: child,
    );
  }
}
