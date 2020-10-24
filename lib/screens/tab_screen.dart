import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/screens/homepage.dart';
import 'package:flutterdragoncity/screens/location_page.dart';
import 'package:flutterdragoncity/screens/profile_screen.dart';
import 'package:flutterdragoncity/widgets/custom_bottom_bar.dart';
import 'package:provider/provider.dart';
class TabScreen extends StatefulWidget {
  static const String routename = '/tab_screen';
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String,Object>> _pages;
  int _selectedPageIndex=0;
  FirebaseAuth _auth;
  StorageReference _storageReference;
  User user;


  @override
  void initState() {
    super.initState();
    _pages=[
      {
        'page': Homepage(),
      },
      {
        'page': LocationPage(),
      },
      {
        'page': UserProfile(),
      }
    ];
    _auth = FirebaseAuth.instance;
    user = _auth.currentUser;
  }

  void selectPage(int index)
  {
    setState(() {
      _selectedPageIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(user!=null)
    Provider.of<AuthServices>(context,listen: false).getUserData(user.uid);
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,

        body: Stack(
          alignment: Alignment(0,1),
          children: [
            _pages[_selectedPageIndex]['page'],
            CustomBottomBar(pageIndex: _selectedPageIndex,changePage: selectPage,),
          ],
        )
      ),
    );
  }
}
