import 'package:flutter/material.dart';
import 'package:flutterdragoncity/localization/localization.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart' as sp;

const LinearGradient backgroundGradient = LinearGradient(
     begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromRGBO(235, 28, 34, 1),
      Color.fromRGBO(131, 1, 1, 0.88),
      Color.fromRGBO(207, 22, 26, 1),
    ]
);

 TextStyle shojuTextStyle = TextStyle(
  fontFamily: 'Shojumaru',
     fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  color: Colors.white,
  fontSize: SizeConfig.textMultiplier * 3.5
);

TextStyle alikeTextStyle = TextStyle(
    fontFamily: 'Alike',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: SizeConfig.textMultiplier * 1.7
);

TextStyle normalTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontSize: SizeConfig.textMultiplier * 1.8
);

const String leftDirection = 'left';
const String rightDirection = 'right';


String getTranslated(BuildContext context,String key)
{
  return DemoLocalizations.of(context).getTranslatedValue(key);
}

const String ENGLISH = 'en';
const String ARABIC = 'ar';

const String LANGUAGE_CODE = 'languageCode';

    Future<Locale> setLocale(String languageCode) async{
    sp.SharedPreferences _prefs = await sp.SharedPreferences.getInstance();
    await _prefs.setString('lang', languageCode);
    return  _locale(languageCode);
    }

Future<Locale> getLocale() async{
  sp.SharedPreferences _prefs = await sp.SharedPreferences.getInstance();
  String langCode =  _prefs.getString('lang')??'en';
  return  _locale(langCode);
}
Locale _locale(String languageCode) {
  Locale _temp;
  switch(languageCode) {
    case ENGLISH:
      _temp = Locale(languageCode,'US');
      break;
    case ARABIC:
      _temp = Locale(languageCode,'BH');
      break;
    default:
      _temp = Locale(ENGLISH,'US');
  }
  return _temp;
}