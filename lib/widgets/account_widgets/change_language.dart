import 'package:flutter/material.dart';
import 'package:flutterdragoncity/data/language.dart';
import 'package:flutterdragoncity/widgets/border_container.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants.dart';
import '../../main.dart';
import '../../size_config.dart';

class ChangeLanguageField extends StatefulWidget {

  final bool isExpanded;
  final FToast toast;

  ChangeLanguageField({
    this.isExpanded,
    this.toast
});

  @override
  _ChangeLanguageFieldState createState() => _ChangeLanguageFieldState();
}

class _ChangeLanguageFieldState extends State<ChangeLanguageField> {

  bool expandMore = false;
  bool isArabic = false;

  void changeLanguage(Language language) async
  {
   Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context,_temp);

  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: widget.isExpanded ? SizeConfig.heightMultiplier * 18 : 0,
      width: SizeConfig.widthMultiplier * 80,
      child: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightMultiplier * 17,
          child: Row(
            children: [
              Spacer(
                flex: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getTranslated(context, 'select_lang'),
                    style: normalTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.textMultiplier * 2),
                  ),
                  Container(
                    height: 6.5 * SizeConfig.heightMultiplier,
                    width: 70 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(216,216,216,1),
                            width: 1
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                          SizeConfig.heightMultiplier * 1.1,
                        ),
                          topLeft: Radius.circular(
                            SizeConfig.heightMultiplier * 1.1,
                          ),
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left : SizeConfig.widthMultiplier * 2,
                      right: SizeConfig.widthMultiplier * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Text(
                           isArabic? getTranslated(context, 'arabic') :  getTranslated(context, 'eng'),
                            style: normalTextStyle.copyWith(
                                color: Colors.black
                            ),
                        ),
                          Container(
                            height: SizeConfig.heightMultiplier * 5,
                            width: SizeConfig.widthMultiplier * 8,
                            child: IconButton(icon:
                            expandMore ? Icon(Icons.expand_less ) : Icon(Icons.expand_more), onPressed: () {
                            setState(() {
                              expandMore = !expandMore;
                            });
                            }),
                          )
                        ],
                        ),
                    ),
                    ),
                  GestureDetector(
                    onTap: () {
                      isArabic = !isArabic;
                      if(!isArabic)
                        {
                          changeLanguage(Language(
                              id: 1,
                              languageCode: 'en',
                              countryCode: 'US'
                          ));
                        }
                      else
                        {
                          changeLanguage(Language(
                              id: 2,
                              languageCode: 'ar',
                              countryCode: 'BH'
                          ));
                        }
                          setState(() {});
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: expandMore ? 6.5 * SizeConfig.heightMultiplier : 0,
                      width: 70 * SizeConfig.widthMultiplier,
                      padding: EdgeInsets.only(
                          left : SizeConfig.widthMultiplier * 2,
                      right : SizeConfig.widthMultiplier * 2,
                          top : SizeConfig.widthMultiplier * 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                          border: Border.all(
                              color: Color.fromRGBO(216,216,216,1),
                              width: 1
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              SizeConfig.heightMultiplier * 1.1,
                            ),
                            bottomLeft: Radius.circular(
                              SizeConfig.heightMultiplier * 1.1,
                            ),
                          )
                      ),
                      child: Text(
                        isArabic? getTranslated(context, 'eng') :  getTranslated(context, 'arabic'),
                      style: normalTextStyle.copyWith(
                        color: Colors.black
                      ),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
