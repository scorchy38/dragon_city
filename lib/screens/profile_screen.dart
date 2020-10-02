import 'package:flutter/material.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/account_widgets/add_profile_pic.dart';

import '../constants.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  Widget buildCustomTile(String title, IconData icon, int id) {
    return Row(
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
            if (id == 1) print('saved jobss yeah');
            if (id == 2) print('');
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
    );
  }

  Widget buildNoExpandTile(String title, IconData icon, int id) {
    return GestureDetector(
      onTap: () {},
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
              height: SizeConfig.heightMultiplier * 70,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildCustomTile('Saved Shops', Icons.bookmark_border, 1),
                    buildCustomTile('Personal Details', Icons.exit_to_app, 2),
                    buildCustomTile('Manage Phone Number', Icons.phone, 3),
                    buildCustomTile('Email ID', Icons.email, 4),
                    buildCustomTile('Change Language', Icons.language, 5),
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
