import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/account_widgets/add_profile_pic.dart';
import 'package:flutterdragoncity/widgets/account_widgets/mobile_number.dart';

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


  Widget buildCustomTile(String title, IconData icon, int id,bool isExpanded) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isExpanded ? SizeConfig.heightMultiplier * 30 : SizeConfig.heightMultiplier * 7,
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
                size: SizeConfig.heightMultiplier * 3.2,
              ),
              Spacer(flex: 1,),
              Container(
                width: SizeConfig.widthMultiplier * 60,
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: normalTextStyle.copyWith(
                      color: Colors.black, fontSize: SizeConfig.textMultiplier * 2.1),
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

                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 3,
                  width: SizeConfig.heightMultiplier * 3,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(225, 225, 225, 1),
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.heightMultiplier * 1))),
                  child: Icon(
                    Icons.expand_more,
                    color: Colors.black,
                    size: SizeConfig.heightMultiplier * 2.5,
                  ),
                ),
              )
            ],
          ),
          id == 1? isExpanded ? EditMobileNumber(isExpanded: isExpanded,) :
          EditMobileNumber(isExpanded: isExpanded,) :
          Container(),
          id == 2? isExpanded ? EditMobileNumber(isExpanded: isExpanded,) :
          EditMobileNumber(isExpanded: isExpanded,) :
          Container(),
          id == 3? isExpanded ? EditMobileNumber(isExpanded: isExpanded,) :
          EditMobileNumber(isExpanded: isExpanded,) :
          Container()
        ],
      ),
    );
  }

  Widget buildNoExpandTile(String title, IconData icon, int id) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: SizeConfig.heightMultiplier * 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.red,
              size: SizeConfig.heightMultiplier * 3.2,
            ),
            Spacer(flex: 1,),
            Container(
              width: SizeConfig.widthMultiplier * 65,
              child: Text(
                title,
                style: normalTextStyle.copyWith(
                    color: Colors.black, fontSize: SizeConfig.textMultiplier * 2.1),
              ),
            ),
            Spacer(flex: 1,)
          ],
    ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                child: AddProfilePicture()),
            Container(
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomTile('Saved Shops', Icons.bookmark_border, 1,savedShopsExpanded),
                    buildCustomTile('Personal Details', Icons.exit_to_app, 2,personalDetailsExpanded),
                    buildCustomTile('Manage Phone Number', Icons.phone, 3,phoneNumExpanded),
                    buildCustomTile('Email ID', Icons.email, 4,emailIdExpanded),
                    buildCustomTile('Change Language', Icons.language, 5,changeLanExpanded),
                    buildNoExpandTile(
                        'Feedback & Complaints', Icons.assignment, 6),
                    buildNoExpandTile('Support', Icons.headset, 7),
                    buildNoExpandTile('Privacy Policy', Icons.lock_outline, 8),
                    buildNoExpandTile(
                        'Terms & Conditions', Icons.error_outline, 9),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
