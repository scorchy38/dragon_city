import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/shop_widget.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {



  List<ShopViewWidget> shops = [
    ShopViewWidget(
      imagePath: 'assets/images/shop_toys.png',
      shopTitle: 'Toys',
      numbers: '183',
    ),
    ShopViewWidget(
      imagePath: 'assets/images/shop_kitchen.png',
      shopTitle: 'Kitchen',
      numbers: '165',
    ),
    ShopViewWidget(
      imagePath: 'assets/images/shop_carpet.png',
      shopTitle: 'Carpet',
      numbers: '209',
    ),
    ShopViewWidget(
      imagePath: 'assets/images/shop_kitchen.png',
      shopTitle: 'Grill',
      numbers: '183',
    ),
  ];
  Widget headerRow(String title,int id)
  {
    return Container(
      height: SizeConfig.heightMultiplier * 8,
      width: SizeConfig.widthMultiplier * 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: shojuTextStyle.copyWith(
              color: Colors.black,
              fontSize: SizeConfig.textMultiplier * 1.9,
              fontWeight: FontWeight.w400
            ),
          ),
          GestureDetector(
            onTap: () {
              if(id == 1)
                {}
              if(id == 2)
              {}
              if(id == 3)
              {}
              if(id == 4)
              {}
              
            },
            child: Text('View All',style: normalTextStyle.copyWith(
              color: Colors.black,
              fontSize: SizeConfig.textMultiplier * 1.6
            ),),
          )
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: backgroundGradient
                  ),
                  height: SizeConfig.heightMultiplier * 46,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 2),
                    child: Column(
                      children: [
                        headerRow('Explore', 1),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: SizeConfig.heightMultiplier * 12.5,
                            width: SizeConfig.widthMultiplier * 150,
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  color: Colors.red,
                                ),
                                Container(
                                  width: 200,
                                  color: Colors.yellow,
                                ),
                                Container(
                                  width: 300,
                                  color: Colors.blue,
                                )
                              ],
                            ),
                          ),
                        ),
                        headerRow('Featured Shops', 2),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: SizeConfig.heightMultiplier * 15,
                            width: SizeConfig.widthMultiplier * 150,
                            child: Row(
                              children: shops
                            ),
                          ),
                        ),
                        headerRow('Services', 3),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: SizeConfig.heightMultiplier * 15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: shops,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
