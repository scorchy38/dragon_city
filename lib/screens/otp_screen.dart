import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';
import '../constants.dart';
class OtpPage extends StatelessWidget {

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();


  Widget buildCodeInputContainer(BuildContext context,
      FocusNode node,
      FocusNode nextNode,
      TextEditingController controller)
  {
    TextInputAction action;
      action = TextInputAction.done;
    return  Container(
      alignment: Alignment.center,
      height: SizeConfig.heightMultiplier * 7,
      width: SizeConfig.heightMultiplier * 7,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textInputAction: action,
        focusNode: node,
        onChanged: (value) {
          if(nextNode != null)
            FocusScope.of(context).requestFocus(nextNode);
        },
        textAlign: TextAlign.center,
        style: normalTextStyle.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.textMultiplier * 2.6
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.heightMultiplier * 100 ,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/vectors/otp_logo.png',
                      height: SizeConfig.heightMultiplier * 30,
                      width: SizeConfig.heightMultiplier * 30,
                    fit: BoxFit.cover,
                    scale: 3,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: SizeConfig.heightMultiplier * 3,
                    width: SizeConfig.widthMultiplier * 60 ,
                    child: Text(
                      'Enter the code, you recieved on \n'
                          '           registered number',
                      style: normalTextStyle.copyWith(
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: SizeConfig.heightMultiplier * 8,
                    width: SizeConfig.widthMultiplier * 90,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCodeInputContainer(context,  focusNode1,focusNode2, controller1),
                        buildCodeInputContainer(context, focusNode2,focusNode3,  controller2),
                        buildCodeInputContainer(context, focusNode3,focusNode4,  controller3),
                        buildCodeInputContainer(context, focusNode4, null, controller4),
                      ],
                    )
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: CustomGoldenButton(
                    style: normalTextStyle,
                    width: 65,
                    height: 6,
                    text: 'Verify',
                  )
                  ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: SizeConfig.heightMultiplier * 30,
                    width: SizeConfig.widthMultiplier * 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Didn\'t recieve a verification code?',
                          style: normalTextStyle.copyWith(
                            letterSpacing: 1.2,
                            fontSize: SizeConfig.textMultiplier * 1.5,
                            fontWeight: FontWeight.w400
                          )
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Text(
                                'Resend Code',
                                style: normalTextStyle,
                              ),
                              VerticalDivider(
                                  thickness: 1,
                                  width: 1,
                                  color: Colors.white
                              ),
                              Text(
                                'Change Number',
                                style: normalTextStyle,
                              ),
                            ]
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
