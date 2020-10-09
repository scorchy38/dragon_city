import 'package:flutter/material.dart';
import 'package:flutterdragoncity/screens/hompage.dart';
import 'package:flutterdragoncity/screens/location_page.dart';
import 'package:flutterdragoncity/screens/profile_screen.dart';
import 'package:flutterdragoncity/widgets/custom_bottom_bar.dart';
class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String,Object>> _pages;
  int _selectedPageIndex=0;


  @override
  void initState() {
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
    super.initState();
  }

  void selectPage(int index)
  {
    setState(() {
      _selectedPageIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
