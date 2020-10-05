import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/border_container.dart';
class EditMobileNumber extends StatelessWidget {
 final bool isExpanded;
  EditMobileNumber({this.isExpanded});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isExpanded ? SizeConfig.heightMultiplier * 23 :0,
      width: SizeConfig.widthMultiplier * 80,
      child: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightMultiplier * 23 ,
          child: Row(
            children: [
              Spacer(flex: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Enter Previous Number',
                    style: normalTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.textMultiplier * 2
                    ),
                  ),
                  BorderedContainer(
                    height: 6,
                    width: 70,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(216,216,216,1),
                              width: 0.6
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(
                            SizeConfig.heightMultiplier * 1.1,
                          ),
                          )
                      ),
                      height: SizeConfig.heightMultiplier * 6,
                      width: SizeConfig.widthMultiplier * 50,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text('+456 ',
                                style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 2,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(32,32,32,1)
                                ),
                              ),
                            ),
                            VerticalDivider(thickness: 1,color: Color.fromRGBO(32,32,32,1),),
                            Container(
                              height: SizeConfig.heightMultiplier * 3,
                              width: SizeConfig.widthMultiplier * 30,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 2,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(32,32,32,1)
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 2,),
                  Text(
                    'Enter Previous Number',
                    style: normalTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.textMultiplier * 2
                    ),
                  ),
                  BorderedContainer(
                    height: 6,
                    width: 70,
                    child: Padding(
                      padding:  EdgeInsets.all(SizeConfig.heightMultiplier),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text('+456 ',
                              style: normalTextStyle.copyWith(
                                  fontSize: SizeConfig.textMultiplier * 2,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(32,32,32,1)
                              ),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,color: Color.fromRGBO(32,32,32,1),),
                          Container(
                            height: SizeConfig.heightMultiplier * 3,
                            width: SizeConfig.widthMultiplier * 30,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: normalTextStyle.copyWith(
                                  fontSize: SizeConfig.textMultiplier * 2,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(32,32,32,1)
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
