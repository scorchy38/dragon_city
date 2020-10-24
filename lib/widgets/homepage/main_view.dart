import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragoncity/data/dummy_data.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/size_config.dart';
class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 8,
            width: double.infinity,
            child: Padding(
              padding:  EdgeInsets.all(SizeConfig.heightMultiplier),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: IconButton(
                        icon: Image.asset('assets/vectors/menu.png',
                          fit: BoxFit.cover,
                        ),
                        onPressed: () {
                         AuthServices().signOut();
                        }),
                  ),
                  Flexible(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset('assets/vectors/dc_logo_2.png'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                        icon: Image.asset('assets/vectors/search.png',

                        ),
                        onPressed: () {}),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                        icon: Image.asset('assets/vectors/notification.png',
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: SizeConfig.heightMultiplier * 36,
            child: Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/shop_detail.png',
                      height: SizeConfig.heightMultiplier * 36 ,
                      width: SizeConfig.widthMultiplier * 80,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/shop_detail.png',
                      height: SizeConfig.heightMultiplier * 36 ,
                      width: SizeConfig.widthMultiplier * 80,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/shop_detail.png',
                      height: SizeConfig.heightMultiplier * 36 ,
                      width: SizeConfig.widthMultiplier * 80,
                    ),
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}

