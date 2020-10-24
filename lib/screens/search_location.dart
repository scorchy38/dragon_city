import 'package:flutter/material.dart';
import 'package:flutterdragoncity/data/dummy_data.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/location/search_item.dart';

import '../constants.dart';
class SearchLocation extends StatefulWidget {

  final Function navigation;
  SearchLocation({this.navigation});
  @override
  _SearchLocationState createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  List<SearchItem> items = [];


  @override
  Widget build(BuildContext context) {
    var verticalPadding = MediaQuery.of(context).padding.top;

    for(var item in DummyWigetsData().searchItems)
      {
        item.navigator = widget.navigation;
        items.add(item);
      }
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: SizeConfig.heightMultiplier * 100-verticalPadding,
          width: SizeConfig.widthMultiplier * 100,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.heightMultiplier * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: SizeConfig.heightMultiplier * 5,
                          width: SizeConfig.widthMultiplier * 65,
                          padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(1.5 *SizeConfig.heightMultiplier)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.3,0.8],
                                colors: [
                                  Color.fromRGBO(131,1,1,1),
                                  Color.fromRGBO(221,48,45,1),
                                ]),
                          ),
                          child: TextField(
                            textAlign: TextAlign.left,
                            style: normalTextStyle.copyWith(
                              fontSize: SizeConfig.textMultiplier * 2,
                            ),
                          )
                      ),
                      FlatButton(onPressed: () {
                        Navigator.of(context).pop();
                      },
                          child: Text(
                        'Cancel',
                        style: normalTextStyle.copyWith(
                          color: Colors.black
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 5,
                  width: SizeConfig.widthMultiplier * 65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        customContainerShort(1, 'Shop Name'),
                      customContainerShort(2, 'Shop No.'),
                      customContainerShort(3, 'Products')
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.heightMultiplier * 70,
                  child: ListView.builder(
                    itemCount: DummyWigetsData().searchItems.length,
                    itemBuilder: (ctx,index) {

                      return  items[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget customContainerShort(int id,String title)
  {
    return  GestureDetector(
      onTap: () {
      },
      child: Container(
          alignment: Alignment.center,
          height: SizeConfig.heightMultiplier * 2,
          width: SizeConfig.widthMultiplier * 20,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Color.fromRGBO(190,149,84,1),
                width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.widthMultiplier)),

          ),
          child: Text(
            title,
            style: normalTextStyle.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.textMultiplier * 1.2,
            ),
          )
      ),
    );
  }
}
