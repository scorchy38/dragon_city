import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/screens/create_account.dart';
import 'package:flutterdragoncity/size_config.dart';
class HighlightedLSContainer extends StatelessWidget {

  final String text;
  HighlightedLSContainer({this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
         border: Border(
           bottom: BorderSide(
             color: Colors.white,
             width: 5,
             style: BorderStyle.solid
           )
         )
        ),
        child: Text(text,
        style: normalTextStyle.copyWith(
          fontSize: SizeConfig.textMultiplier * 2.3,
            fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}
class NormalLSContainer extends StatelessWidget {

  final String text;
  NormalLSContainer({this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx)=> CreateNewAccount())
          );
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.white,
                      width: 1,
                      style: BorderStyle.solid
                  )
              )
          ),
          child: Text(text,
            style: normalTextStyle.copyWith(
                fontSize: SizeConfig.textMultiplier * 2.3,
              fontWeight: FontWeight.w400
            ),),
        ),
      ),
    );
  }
}

