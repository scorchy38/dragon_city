//This page will present user to choose between arabic and english language

import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/screens/login_signup.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';

class LanguageSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Language',
                    style: shojuTextStyle,
                    )
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                   child: Image.asset('assets/vectors/objects.png',
                   fit: BoxFit.cover,
                   scale: 3,
                   ),
                  )
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                   child: Padding(
                     padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         SizedBox(height: SizeConfig.heightMultiplier * 2,),
                         Text(
                           'Choose a language to continue',
                         style: normalTextStyle,
                         ),
                         SizedBox(height: SizeConfig.heightMultiplier * 2,),
                         GestureDetector(
                           onTap: () {
                             Navigator.of(context).push(
                               MaterialPageRoute(builder: (ctx)=> LoginSignUp())
                             );
                           },
                             child: CustomGoldenButton(text: 'Arabic',style: alikeTextStyle,width: 50,height: 5.2,)),
                         SizedBox(height: SizeConfig.heightMultiplier * 2,),
                         GestureDetector(
                           onTap: () {
                             Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx)=> LoginSignUp())
                             );

                           },
                             child: CustomGoldenButton(text: 'English',style: alikeTextStyle,width: 50,height: 5.2,))
                       ],
                     ),
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
