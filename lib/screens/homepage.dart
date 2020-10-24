import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/data/dummy_data.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/homepage/explore_items.dart';
import 'package:flutterdragoncity/widgets/homepage/main_view.dart';
import 'package:flutterdragoncity/widgets/homepage/service_item.dart';
import 'package:flutterdragoncity/widgets/shop_widget.dart';
import '../screens/explore_screen.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Widget headerRow(String key,int id)
  {
    return Container(
      height: SizeConfig.heightMultiplier * 8,
      width: SizeConfig.widthMultiplier * 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
          getTranslated(context, key),
            style: shojuTextStyle.copyWith(
              color: Colors.black,
              fontSize: SizeConfig.textMultiplier * 2,
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
            child: Text(
            getTranslated(context,'view_all')
            ,style: normalTextStyle.copyWith(
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
                  child: MainView(),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 2),
                    child: Column(
                      children: [
                       headerRow( 'explore', 1),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: SizeConfig.heightMultiplier * 14,
                            child: Row(
                              children:[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (ctx)=> ExploreScreen(
                                        id: 1,
                                      ))
                                    );
                                  },
                                  child: ExploreItem(
                                      id: '1',
                                      vectorPath: 'assets/vectors/explore_vect/electronics.png',
                                      label : 'electronics'
                                  ),
                                ),
                                ExploreItem(
                                    id: '2',
                                    vectorPath: 'assets/vectors/explore_vect/home_fur.png',
                                    label : 'home_fur'
                                ),
                                ExploreItem(
                                    id: '3',
                                    vectorPath: 'assets/vectors/explore_vect/lightening.png',
                                    label : 'lightening'
                                ),
                                ExploreItem(
                                    id: '4',
                                    vectorPath: 'assets/vectors/explore_vect/furniture.png',
                                    label : 'furniture'
                                ),
                                ExploreItem(
                                    id: '5',
                                    vectorPath: 'assets/vectors/explore_vect/toys.png',
                                    label : 'toys'
                                )
                              ]
                          ),
                        ),
                        ),
                       headerRow('featured_shop', 2),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: SizeConfig.heightMultiplier * 15,
                            child: Row(
                              children: DummyWigetsData().shops
                            ),
                          ),
                        ),
                        headerRow('services', 3),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: SizeConfig.heightMultiplier * 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children:[
                               ServiceItem(
                                   id: '1',
                                   vectorPath: 'assets/vectors/services_vect/bank.png',
                                   label :'bank'
                               ),
                               ServiceItem(
                                   id: '2',
                                   vectorPath: 'assets/vectors/services_vect/atm.png',
                                   label : 'atm'
                               ),
                               ServiceItem(
                                   id: '3',
                                   vectorPath: 'assets/vectors/services_vect/info.png',
                                   label : 'info'
                               ),
                               ServiceItem(
                                   id: '4',
                                   vectorPath: 'assets/vectors/services_vect/mosque.png',
                                   label : 'mosque'
                               ),
                               ServiceItem(
                                   id: '5',
                                   vectorPath: 'assets/vectors/services_vect/male_restroom.png',
                                   label : 'm_restroom'
                               ),
                               ServiceItem(
                                   id: '6',
                                   vectorPath: 'assets/vectors/services_vect/female_restroom.png',
                                   label : 'f_restroom'
                               )
                             ]
                            ),
                          ),
                        ),
                        headerRow( 'most_viewed', 4),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: SizeConfig.heightMultiplier * 15,
                            child: Row(
                                children: DummyWigetsData().shops
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 8,),
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
