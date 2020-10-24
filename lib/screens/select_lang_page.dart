//This page will present user to choose between arabic and english language

import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/data/language.dart';
import 'package:flutterdragoncity/screens/login_signup.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';

import '../main.dart';

class LanguageSelectorPage extends StatefulWidget {



  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {


  @override
  void initState() {
    super.initState();
  }

  void changeLanguage(Language language,BuildContext context) async
  {
   Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context,_temp);

  }

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
                      getTranslated(context, 'language'),
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
                           getTranslated(context, 'choose_lang'),
                         style: normalTextStyle,
                         ),
                         SizedBox(height: SizeConfig.heightMultiplier * 2,),
                         GestureDetector(
                           onTap: () {
                             changeLanguage(
                                 Language(
                                 id: 2,
                                 languageCode: 'ar',
                                 countryCode: 'BH'
                             ), context);
                             Navigator.of(context).push(
                               MaterialPageRoute(builder: (ctx)=> LoginSignUp())
                             );
                           },
                             child: CustomGoldenButton(text: getTranslated(context, 'arabic'),
                               style: alikeTextStyle,width: 50,height: 5.2,)),
                         SizedBox(height: SizeConfig.heightMultiplier * 2,),
                         GestureDetector(
                           onTap: () async{
                             changeLanguage(
                                 Language(
                                     id: 1,
                                     languageCode: 'en',
                                     countryCode: 'US'
                                 ), context);
                             Navigator.of(context).push(
                                 MaterialPageRoute(builder: (ctx)=> LoginSignUp())
                             );

                           },
                             child: CustomGoldenButton(text: getTranslated(context, 'eng'),
                               style: alikeTextStyle,width: 50,height: 5.2,))
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
