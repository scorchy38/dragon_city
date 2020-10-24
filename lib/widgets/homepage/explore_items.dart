import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
class ExploreItem extends StatelessWidget {

  final String id;
  final String label;
  final String vectorPath;
  ExploreItem({
    this.id,
    this.vectorPath,
    this.label
});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 14,
      width: SizeConfig.heightMultiplier * 11,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 4)),
                  child: Image.asset(
                    'assets/vectors/explore_vect/grey_background.png',
                    height: SizeConfig.heightMultiplier * 9,
                  fit: BoxFit.fitHeight,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 4)),
                  child: Image.asset(

                    'assets/vectors/explore_vect/yellow_bgrd.png',
                    height: SizeConfig.heightMultiplier * 7.1,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier * 4)),
                  child: Image.asset(
                    vectorPath,
                    height: SizeConfig.heightMultiplier * 5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            Container(
              height: SizeConfig.heightMultiplier * 3.5,
              width: SizeConfig.widthMultiplier * 20,
              child: Text(
                getTranslated(context, label),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: normalTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
    );
  }
}
