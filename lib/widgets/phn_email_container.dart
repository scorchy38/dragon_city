import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
class PhnEmailContainer extends StatefulWidget {

  final String text;
  final String direction;
  final Color textColor;
  final Color containerColor;
  PhnEmailContainer({this.text,this.direction,this.textColor,this.containerColor});
  @override
  _PhnEmailContainerState createState() => _PhnEmailContainerState();
}

class _PhnEmailContainerState extends State<PhnEmailContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 3,
      width: SizeConfig.widthMultiplier * 25,
      decoration: BoxDecoration(
        color: widget.containerColor,
        border: Border.all(width: 1,color: Colors.white),
        borderRadius: BorderRadius.only(
             topRight: widget.direction == 'right'?
             Radius.circular(SizeConfig.heightMultiplier * 1.5):Radius.zero,
            bottomRight:  widget.direction == 'right'?Radius.circular(SizeConfig.heightMultiplier * 1.5):Radius.zero,
            topLeft: widget.direction == 'left'?Radius.circular(SizeConfig.heightMultiplier * 1.5):Radius.zero,
            bottomLeft: widget.direction == 'left'?Radius.circular(SizeConfig.heightMultiplier * 1.5):Radius.zero
        )
      ),
      alignment: Alignment.center,
      child: Text(widget.text,
      style: normalTextStyle.copyWith(
        color: widget.textColor,
        fontWeight: FontWeight.w400,
        fontSize: SizeConfig.textMultiplier * 1.4
      ),
      ),
    );
  }
}
