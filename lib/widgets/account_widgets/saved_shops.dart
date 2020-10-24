import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants.dart';
import '../../size_config.dart';
class SavedShopsField extends StatelessWidget {

   final bool isExpanded;
   final FToast toast;

   SavedShopsField({
     this.isExpanded,
     this.toast
});

   Widget buildButtons(String title, double height,double width)
   {
     return GestureDetector(
       onTap: () {},
       child: Container(
           alignment: Alignment.center,
           height: SizeConfig.heightMultiplier * height,
           width: SizeConfig.widthMultiplier * width,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(1.1*SizeConfig.heightMultiplier)),
             gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 stops: [0.3,0.8],
                 colors: [
                   Color.fromRGBO(131,1,1,1),
                   Color.fromRGBO(221,48,45,1),

                 ]),
           ),
           child: Text(
             title,
             style: normalTextStyle,
           )
       ),
     );
   }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(

      duration: Duration(milliseconds: 300),
      height: isExpanded ? SizeConfig.heightMultiplier * 30 : 0,
      width: SizeConfig.widthMultiplier * 90,
      child: SingleChildScrollView(
        child: Container(

          height: SizeConfig.heightMultiplier * 30,
          child: Row(
            children: [
              Spacer(
                flex: 6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: SizeConfig.heightMultiplier * 24,
                    width: SizeConfig.widthMultiplier * 80,
                    child: ListView.builder(
                      itemCount: 3,
                        itemBuilder: (ctx,index) {
                          return Container(
                            height: SizeConfig.heightMultiplier * 7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      SizeConfig.heightMultiplier * 1.1)),
                                  child: Container(
                                    height: SizeConfig.heightMultiplier * 5.5,
                                    width: SizeConfig.widthMultiplier * 16,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Container(
                                  height: SizeConfig.heightMultiplier * 5.5,
                                  width: SizeConfig.widthMultiplier * 40,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: SizeConfig.heightMultiplier * 2,
                                        width: SizeConfig.widthMultiplier * 20,
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                '52',
                                                style: normalTextStyle.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                ),
                                              ),
                                              SizedBox(width: SizeConfig.widthMultiplier,),
                                              VerticalDivider(thickness: 1,
                                                  width: 1,
                                                  color: Colors.black),
                                              SizedBox(width: SizeConfig.widthMultiplier,),
                                              Text(
                                                'Toys',
                                                style: normalTextStyle.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Container(

                                          height: SizeConfig.heightMultiplier * 2,
                                          width: SizeConfig.widthMultiplier * 40,
                                          child: Text(
                                            'Asna Home Decoration',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: normalTextStyle.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black
                                            ),
                                          )
                                      ),
                                    ],
                                  )
                                ),
                                Container(
                                  height: SizeConfig.heightMultiplier * 3,
                                  width: SizeConfig.widthMultiplier * 8,
                                  child: Image.asset(
                                    'assets/vectors/directions.png',
                                    fit: BoxFit.scaleDown,),
                                )
                              ],
                            ),
                          );
                        }
                  ),
                  ),
                  buildButtons('View All', 3.5, 41)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
