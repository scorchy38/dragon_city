import 'package:flutter/material.dart';
import 'package:flutterdragoncity/data/dummy_data.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/location/search_item.dart';
import '../screens/search_location.dart';

import '../constants.dart';
class LocationPage extends StatefulWidget {



  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {


  bool isNavigationOn = false;

  void navigateToShop(int id)
  {
    isNavigationOn = !isNavigationOn;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: Stack(
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 100,
              width: SizeConfig.widthMultiplier * 100,
              color: Colors.grey[200]
            ),
            !isNavigationOn ? Container(
              height: SizeConfig.heightMultiplier * 100,
              width: SizeConfig.widthMultiplier * 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: SizeConfig.heightMultiplier * 18,
                    width: SizeConfig.widthMultiplier * 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customContainerLong(1, 'Your Location', Icons.location_on,context),
                        customContainerLong(2, 'Shop No. 52', Icons.store_mall_directory,context),
                        Container(
                          height: SizeConfig.heightMultiplier * 3.5,
                          width: SizeConfig.widthMultiplier * 65,
                          alignment: Alignment.center,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customContainerShort(1, '137 Steps', Icons.directions_walk),
                              customContainerShort(2, '15 mins', Icons.watch_later)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2),
                      height: SizeConfig.heightMultiplier * 8,
                      child: Row(
                          children: [
                            customCircle(1, 'assets/vectors/services_vect/bank.png'),
                            customCircle(2, 'assets/vectors/services_vect/atm.png'),
                            customCircle(3, 'assets/vectors/services_vect/info.png'),
                            customCircle(4, 'assets/vectors/services_vect/mosque.png'),
                            customCircle(5, 'assets/vectors/services_vect/male_restroom.png'),
                            customCircle(6, 'assets/vectors/services_vect/female_restroom.png'),
                          ]
                      ),
                    ),
                  ),
                  Spacer(flex: 1,)
                  ]
              ),
            ):
                Container(
                  height: SizeConfig.heightMultiplier * 10,
                  width: SizeConfig.widthMultiplier * 100 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight : Radius.circular(2*SizeConfig.heightMultiplier),
                        bottomLeft : Radius.circular(2*SizeConfig.heightMultiplier)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3,0.8],
                            colors : [
                          Color.fromRGBO(131,1,1,1),
                          Color.fromRGBO(221,48,45,1),
                        ]),
                  ),
                  padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(
                  SizeConfig.heightMultiplier * 1.5)),
          child: Image.asset('assets/images/shop_toys.png',
            height: SizeConfig.heightMultiplier * 7,
            width: SizeConfig.heightMultiplier * 7,
            fit: BoxFit.cover,
          )
      ),
      SizedBox(width: SizeConfig.widthMultiplier * 2.5,),
      Expanded(
        child: Container(
          height: SizeConfig.heightMultiplier * 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: SizeConfig.heightMultiplier * 2,
                    child: Text(
                        '52',
                        style: normalTextStyle
                    )
                ),
                Container(
                    height: SizeConfig.heightMultiplier * 2,
                    child: Text(
                      'Ashna Home Decoration Bahrain Co. W.L.L',
                      style: normalTextStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.textMultiplier * 1.5,
                      ),
                    )
                ),
                Container(
                    height: SizeConfig.heightMultiplier * 2.5,
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 2.5,
                          width: SizeConfig.widthMultiplier * 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.directions_walk,
                                color: Colors.white,
                                size: SizeConfig.heightMultiplier * 2,),

                              Text(
                                '137 steps',
                                style: normalTextStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.textMultiplier * 1.5
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1,),
                        Container(
                          height: SizeConfig.heightMultiplier * 2.5,
                          width: SizeConfig.widthMultiplier * 18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: Colors.white,
                                size: SizeConfig.heightMultiplier * 1.7,),

                              Text(
                                '15 min',
                                style: normalTextStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.textMultiplier * 1.5
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 8,),

                      ],
                    )
                )
              ],
            )
        ),
                ),
                    GestureDetector(
                      onTap: () {
                        navigateToShop(1);
                      },
                      child: Container(
                        height: SizeConfig.heightMultiplier * 4,
                        width: SizeConfig.widthMultiplier * 15,
                        child: Icon(Icons.cancel,
                          size: SizeConfig.heightMultiplier * 4,
                          color: Colors.white,
                        ),
                      ),
                    )
          ],
        ),
      ),
        ]
      ),
    ),
    );
  }

  Widget customContainerLong(int id,String title,IconData icon,BuildContext context)
  {
    return  GestureDetector(
      onTap: () {
        if(id==2)
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx)=> SearchLocation(navigation: navigateToShop,),
            )
          );
      },
      child: Container(
          padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2),
          alignment: Alignment.centerLeft,
          height: SizeConfig.heightMultiplier * 4.5,
          width: SizeConfig.widthMultiplier * 65,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Color.fromRGBO(190,149,84,1),
                width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier)),

          ),
          child: Row(
            children: [
              Icon(icon,color: Color.fromRGBO(190,149,84,1),
                size: SizeConfig.heightMultiplier * 2.5,
              ),
               SizedBox(width: SizeConfig.widthMultiplier *2,),
               Text(
                title,
                style: normalTextStyle.copyWith(
                  color: Color.fromRGBO(190,149,84,1),
                  fontSize: SizeConfig.textMultiplier * 1.5,
                ),
              )
            ],
          )
      ),
    );
  }

  Widget customContainerShort(int id,String title,IconData icon)
  {
    return  GestureDetector(
      onTap: () {
      },
      child: Container(
          alignment: Alignment.center,
          height: SizeConfig.heightMultiplier * 3.3,
          width: SizeConfig.widthMultiplier * 30,
          padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Color.fromRGBO(190,149,84,1),
                width: 1
            ),
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.widthMultiplier * 1.5)),

          ),
          child:Row(
            children: [
              Icon(icon,color: Color.fromRGBO(190,149,84,1),
                size: SizeConfig.heightMultiplier * 2.5,
              ),
              SizedBox(width: SizeConfig.widthMultiplier *2,),
              Text(
                title,
                style: normalTextStyle.copyWith(
                  color: Color.fromRGBO(190,149,84,1),
                  fontSize: SizeConfig.textMultiplier * 1.5,
                ),
              )
            ],
          )
      ),
    );
  }

   Widget customCircle(int id,String vectorPath) {

    return GestureDetector(
      onTap: (){
      },
      child: Container(
        height: SizeConfig.heightMultiplier * 14,
        width: SizeConfig.heightMultiplier * 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier )),
                  child: Image.asset(
                    'assets/vectors/explore_vect/yellow_bgrd.png',
                    height: SizeConfig.heightMultiplier * 7.1,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier )),
                  child: Image.asset(
                    vectorPath,
                    height: SizeConfig.heightMultiplier * 3.8,
                    fit: BoxFit.fitHeight,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
   }
}
