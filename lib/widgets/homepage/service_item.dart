import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';

import '../../constants.dart';
class ServiceItem extends StatelessWidget {
  final String id;
  final String vectorPath;
  final String label;

  ServiceItem({
    this.id,
    this.vectorPath,
    this.label
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(id);
      },
      child: Container(
        height: SizeConfig.heightMultiplier * 14,
        width: SizeConfig.heightMultiplier * 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier )),
                  child: Image.asset(
                    'assets/vectors/services_vect/red_bgrd.png',
                    height: SizeConfig.heightMultiplier * 7.1,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier )),
                  child: Image.asset(
                    vectorPath,
                    height: SizeConfig.heightMultiplier * 4.5,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            Container(
              height: SizeConfig.heightMultiplier * 3,
              width: SizeConfig.widthMultiplier * 20,
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: normalTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.textMultiplier * 1.7,
                  color: Colors.black,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
