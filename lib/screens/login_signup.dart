import 'package:flutter/material.dart';
import 'package:flutterdragoncity/widgets/login_screen/email_widget.dart';
import 'package:flutterdragoncity/widgets/login_screen/phn_no_widget.dart';
import 'package:flutterdragoncity/widgets/login_signup_custom_container.dart';
import 'package:flutterdragoncity/widgets/phn_email_container.dart';

import '../constants.dart';
import '../size_config.dart';
class LoginSignUp extends StatefulWidget {
  @override
  _LoginSignUpState createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {

  bool isPhoneSelected = true;
  bool isEmailSelected = false;
  double phnOpacity = 1;
  double emailOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Image.asset('assets/images/whitelogo_1.png'),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      child: Row(
                        children: [
                          HighlightedLSContainer(text: 'Login',),
                          NormalLSContainer(text: 'Sign Up',)
                        ],
                      )
                  )
              ),
              Spacer(flex: 1,),
              Expanded(
                  flex: 9,
                  child: Container(
                    width: SizeConfig.widthMultiplier * 90,
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.heightMultiplier * 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome',
                            style: shojuTextStyle,
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 3,),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: SizeConfig.widthMultiplier * 50,
                              child: Row(
                                  children:[
                                    GestureDetector(
                                      onTap: () {
                                       setState(() {
                                         isEmailSelected = false;
                                         isPhoneSelected = true;
                                         phnOpacity =1;
                                         emailOpacity = 0;
                                       });
                                      },
                                        child: isPhoneSelected ?
                                        PhnEmailContainer(text: 'Phone No.',direction: leftDirection,
                                            textColor: Colors.red,
                                            containerColor : Colors.white):
                                        PhnEmailContainer(text: 'Phone No.',direction: leftDirection,
                                        textColor: Colors.white,
                                        containerColor: Colors.transparent,)),
                                    GestureDetector(
                                      onTap: () {
                                        isEmailSelected = true;
                                        isPhoneSelected = false;
                                        setState(() {
                                          emailOpacity = 1;
                                          phnOpacity =0;
                                        });
                                      },
                                        child: isEmailSelected ?
                                        PhnEmailContainer(text: 'Email ID',direction: rightDirection,
                                          textColor: Colors.red,
                                          containerColor :Colors.white
                                        ):
                                        PhnEmailContainer(text: 'Email ID',direction: rightDirection,
                                        textColor: Colors.white,
                                        containerColor: Colors.transparent,)
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2,),
//                          Container(
//                            height: SizeConfig.heightMultiplier * 30,
//                            width: SizeConfig.widthMultiplier * 100,
//                            child: !isEmailSelected ? PhoneNumberWidget() : EmailLoginWidget()
//                          ),
//
                        //Below code is for animating the change of widgets
                          Container(
                            height: SizeConfig.heightMultiplier * 30,
                            width: SizeConfig.widthMultiplier * 100,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity: phnOpacity ,
                                    curve: Curves.easeIn,
                                    child: PhoneNumberWidget()
                                ),
                                AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity: emailOpacity ,
                                    curve: Curves.easeIn,
                                    child: EmailLoginWidget()
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2,),
                          Align(
                            alignment: Alignment.center,
                              child: Text('SKIP',style: normalTextStyle,))
                        ],
                      ),
                    ),
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                    child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 2,
                              right: SizeConfig.heightMultiplier * 2),
                              child: Divider(
                                thickness: 1,color: Colors.white,),
                            ),
                            Text('Or Login using social media',style: normalTextStyle.copyWith(
                              fontWeight: FontWeight.w400
                            ),),
                            Container(
                              child: Image.asset('assets/images/union.png',),
                            )
                          ],
                        )
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
