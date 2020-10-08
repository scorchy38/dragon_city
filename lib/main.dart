import 'package:flutter/material.dart';
import 'package:flutterdragoncity/screens/create_account.dart';
import 'package:flutterdragoncity/screens/hompage.dart';
import 'package:flutterdragoncity/screens/login_signup.dart';
import 'package:flutterdragoncity/screens/otp_screen.dart';
import 'package:flutterdragoncity/screens/profile_screen.dart';
import 'package:flutterdragoncity/screens/shop_detail.dart';
import 'package:flutterdragoncity/size_config.dart';

import 'screens/select_lang_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints)
      {
        return  OrientationBuilder(
            builder: (context,orientation) {
              SizeConfig().init(constraints, orientation,context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Dragon City',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: Homepage(),
              );
            }
        );
      }
    );
  }
}
