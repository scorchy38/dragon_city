
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragoncity/data/user_details.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/account_widgets/add_profile_pic.dart';
import 'package:flutterdragoncity/widgets/account_widgets/change_language.dart';
import 'package:flutterdragoncity/widgets/account_widgets/email_field.dart';
import 'package:flutterdragoncity/widgets/account_widgets/mobile_number.dart';
import 'package:flutterdragoncity/widgets/account_widgets/saved_shops.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  bool savedShopsExpanded = false;
  bool personalDetailsExpanded = false;
  bool phoneNumExpanded = false;
  bool emailIdExpanded = false;
  bool changeLanExpanded = false;
  String userName;
  FToast fToast;



  Widget buildCustomTile(
      String title,
      IconData icon,
      int id,
      bool isExpanded,
      double height
      ) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isExpanded ? SizeConfig.heightMultiplier * height : SizeConfig.heightMultiplier * 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.red,
                size: SizeConfig.heightMultiplier * 3,
              ),
              Spacer(flex: 1,),
              Container(
                width: SizeConfig.widthMultiplier * 60,
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: normalTextStyle.copyWith(
                      color: Colors.black, fontSize: SizeConfig.textMultiplier * 2),
                ),
              ),
              Spacer(flex: 1,),
              GestureDetector(
                onTap: () {
                  if (id == 1)
                  {
                    setState(() {
                      savedShopsExpanded = !savedShopsExpanded;
                    });
                  }
                  if (id == 2) {setState(() {
                    personalDetailsExpanded = !personalDetailsExpanded;
                  });}
                  if (id == 3)
                  {
                    setState(() {
                      phoneNumExpanded = !phoneNumExpanded;
                    });
                  }
                  if (id == 4)
                  {
                    setState(() {
                      emailIdExpanded = !emailIdExpanded;
                    });
                  }
                  if (id == 5)
                  {
                    setState(() {
                      changeLanExpanded = !changeLanExpanded;
                    });
                  }
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 3,
                  width: SizeConfig.heightMultiplier * 3,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(225, 225, 225, 1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.heightMultiplier * 1))),
                  child: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.black,
                    size: SizeConfig.heightMultiplier * 2.2,
                  ),
                ),
              )
            ],
          ),
          id == 1? isExpanded ? SavedShopsField(isExpanded: isExpanded,toast: fToast ) :
          SavedShopsField(isExpanded: isExpanded,) :
          Container(),
          id == 3? isExpanded ? EditMobileNumber(isExpanded: isExpanded,toast: fToast ) :
          EditMobileNumber(isExpanded: isExpanded,) :
          Container(),
          id == 4? isExpanded ? EmailField(isExpanded: isExpanded,toast: fToast,) :
          EmailField(isExpanded: isExpanded,) :
          Container(),
          id == 5? isExpanded ? ChangeLanguageField(isExpanded: isExpanded,toast: fToast,) :
          ChangeLanguageField(isExpanded: isExpanded,) :
          Container(),
        ],
      ),
    );
  }

  Widget buildNoExpandTile(String title, IconData icon, int id) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: SizeConfig.heightMultiplier * 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.red,
              size: SizeConfig.heightMultiplier * 3,
            ),
            Spacer(flex: 1,),
            Container(
              width: SizeConfig.widthMultiplier * 65,
              child: Text(
                title,
                style: normalTextStyle.copyWith(
                    color: Colors.black, fontSize: SizeConfig.textMultiplier * 2),
              ),
            ),
            Spacer(flex: 1,)
          ],
    ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {

   final  userData = Provider.of<AuthServices>(context,listen: true).userDetails;
    return Scaffold(
      body: Builder(
        builder: (scaffoldContext)=>SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: SizeConfig.heightMultiplier * 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight:
                              Radius.circular(SizeConfig.heightMultiplier * 2.8),
                          bottomLeft:
                              Radius.circular(SizeConfig.heightMultiplier * 2.8)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromRGBO(131, 1, 1, 1),
                            Color.fromRGBO(235, 28, 34, 1)
                          ])),
                  child: AddProfilePicture(
                    name: userData==null?'User1192': userData.username,
                    imageLink : userData == null ? null : userData.imageUrl
                  )),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2.8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCustomTile(getTranslated(context, 'saved_shops'), Icons.bookmark_border, 1,savedShopsExpanded,34),
                      buildCustomTile(getTranslated(context, 'personal_details'), Icons.exit_to_app, 2,personalDetailsExpanded,30),
                      buildCustomTile(getTranslated(context, 'manage_ph_no'), Icons.phone, 3,phoneNumExpanded,30),
                      buildCustomTile(getTranslated(context, 'email_ID'), Icons.email, 4,emailIdExpanded,30),
                      buildCustomTile(getTranslated(context, 'change_language'), Icons.language, 5,changeLanExpanded,22),
                      buildNoExpandTile(
                          getTranslated(context, 'feedback_complaints'), Icons.assignment, 6),
                      buildNoExpandTile(getTranslated(context, 'support'), Icons.headset, 7),
                      buildNoExpandTile(getTranslated(context, 'privacy_policy'), Icons.lock_outline, 8),
                      buildNoExpandTile(
                          getTranslated(context, 'terms_cond'), Icons.error_outline, 9),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
