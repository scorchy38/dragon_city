import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
class ShopDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    var safeAreaVertical = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.black,
        height: SizeConfig.heightMultiplier * 100,
        child: Stack(
          children: [
           buildUpperView(context),
            buildLowerView(context)
          ],
        ),
      ),
    );
  }

  Widget buildLabelRow()
  {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: Text(
              'Asna Home Decorations Bahrain Co. W.L.L',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: shojuTextStyle.copyWith(
                  fontSize: SizeConfig.textMultiplier * 1.6,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
          ),
        ),
        Container(
          height: SizeConfig.heightMultiplier * 3,
          width: SizeConfig.widthMultiplier * 10,
          child: Image.asset('assets/vectors/fb_vect.png',fit: BoxFit.contain,),
        ),
        Container(
          height: SizeConfig.heightMultiplier * 3,
          width: SizeConfig.widthMultiplier * 10,
          child: Image.asset('assets/vectors/insta_vect.png',fit: BoxFit.contain,),
        ),
        Container(
          height: SizeConfig.heightMultiplier * 2.7,
          width: SizeConfig.widthMultiplier * 12,
          child: Image.asset('assets/vectors/email_vect.png',fit: BoxFit.contain,),
        )

      ],
    );
  }

  Widget buildCustomShopItem(String imagePath, String number)
  {
    return Container(
      height: SizeConfig.heightMultiplier * 16,
      width: SizeConfig.heightMultiplier * 18,
      child: Row(
        children: [
          Stack(
            alignment: Alignment(0, 0.8),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.heightMultiplier*3),
                ),
                child: Image.asset(
                  imagePath,
                  height: SizeConfig.heightMultiplier * 15,
                  width: SizeConfig.heightMultiplier * 15,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: SizeConfig.heightMultiplier * 2,
                width: SizeConfig.widthMultiplier * 25,
                alignment: Alignment.center,
                child:  Text(
                  number,
                  style: normalTextStyle.copyWith(
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),

            ],
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 5,)
        ],
      ),
    );
  }

  Widget buildUpperView(BuildContext context)
  {
    return  Container(
      height: SizeConfig.heightMultiplier * 55,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0,1),
            child: Container(
              height: SizeConfig.heightMultiplier * 5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 1)
                    )
                  ]
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeConfig.heightMultiplier * 5)
            ),
            child: Image.asset('assets/images/shop_detail.png',
              height: SizeConfig.heightMultiplier * 55,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment(0,1),
            child: Container(
              margin: EdgeInsets.only(left: SizeConfig.heightMultiplier* 5),
              height: SizeConfig.heightMultiplier * 1,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(SizeConfig.heightMultiplier * 5)
                  ),
                  backgroundBlendMode: BlendMode.darken,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset(1,0),
                    ),
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 4,
                        blurRadius: 20,
                        offset: Offset(0, 1)
                    ),
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 4,
                        blurRadius: 20,
                        offset: Offset(0.5, 1)
                    ),


                  ]
              ),
            ),
          ),
          Positioned(
              bottom: SizeConfig.heightMultiplier * 2,
              left: SizeConfig.widthMultiplier * 8,
              child: buildButtons(1,'call', Icons.call, 6, 30,context)
          ),
          Positioned(
              bottom: SizeConfig.heightMultiplier * 2,
              right: SizeConfig.widthMultiplier * 7,
              child: buildButtons(2, 'navigate', Icons.directions_walk, 6, 50,context)
          ),
          Positioned(
              top: SizeConfig.heightMultiplier * 2,
              left: SizeConfig.widthMultiplier * 3,
              child:IconButton(
                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,
                    size: SizeConfig.heightMultiplier * 3,),
                  onPressed: () {
                      Navigator.of(context).pop();
                  })
          ),
          Positioned(
              top: SizeConfig.heightMultiplier * 2,
              right: SizeConfig.widthMultiplier * 3,
              child: IconButton(
                  icon: Icon(Icons.bookmark_border,color: Colors.white,
                    size: SizeConfig.heightMultiplier * 3,),
                  onPressed: () {
                    print('Saved');
                  })
          ),

        ],
      ),
    );
  }

  Widget buildLowerView(BuildContext context)
  {
    return Align(
      alignment: Alignment(0,1),
      child: Container(
        padding: EdgeInsets.only(
          left: SizeConfig.heightMultiplier * 3,
          top: SizeConfig.heightMultiplier * 2,
          bottom: SizeConfig.heightMultiplier * 2,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(SizeConfig.heightMultiplier * 5),
          ),
        ),
        height: SizeConfig.heightMultiplier * 45,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: SizeConfig.heightMultiplier * 7,
                width: SizeConfig.widthMultiplier * 90,
                child: buildLabelRow()
            ),
            Container(
              height: SizeConfig.heightMultiplier * 2,
              width: SizeConfig.widthMultiplier * 40,
              child: Row(
                  children: [
                    Text(
                      'Home Furnishing',
                      style: normalTextStyle.copyWith(
                          color: Colors.black,
                        fontSize: SizeConfig.textMultiplier * 1.5
                      ),
                    ),
                    Container(
                        width: SizeConfig.widthMultiplier * 3,
                        child: VerticalDivider(thickness: 2, width: 2, color: Colors.black)),
                    Text(
                      '52',
                      style: normalTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: SizeConfig.textMultiplier * 1.5
                      ),
                    ),
                  ]),
            ),
            Container(
                height: SizeConfig.heightMultiplier * 6,
                width: SizeConfig.widthMultiplier * 80,
                child: Text(
                  'Your inspiration for gorgeous decor design is found here',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: normalTextStyle.copyWith(
                      fontSize: SizeConfig.textMultiplier * 1.8,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                  ),
                )
            ),
            Container(
                height: SizeConfig.heightMultiplier * 5,
                width: SizeConfig.widthMultiplier * 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTranslated(context, 'similar_shop'),
                      style: shojuTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: SizeConfig.textMultiplier * 2,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Add viewAll function
                      },
                      child: Text(
                        getTranslated(context, 'view_all')
                      ,style: normalTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: SizeConfig.textMultiplier * 1.5
                      ),),
                    )
                  ],
                )
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: SizeConfig.heightMultiplier * 15,
                child: Row(
                    children: [
                      buildCustomShopItem('assets/images/002.png', '002'),
                      buildCustomShopItem('assets/images/004.png', '004'),
                      buildCustomShopItem('assets/images/044.png', '044'),
                      buildCustomShopItem('assets/images/006.png', '006'),

                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtons(int id,String title, IconData icon, double height,double width,BuildContext context)
  {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: SizeConfig.heightMultiplier * height,
        width: SizeConfig.widthMultiplier * width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10*SizeConfig.heightMultiplier)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3,0.8],
              colors: [
                Color.fromRGBO(131,1,1,1),
                Color.fromRGBO(221,48,45,1),

              ]),
        ),
        child: FlatButton.icon(icon: Icon(icon,color: Colors.white,), onPressed: () {
        },
        label: Text(
          getTranslated(context, title),
        style: normalTextStyle.copyWith(
          fontSize: SizeConfig.textMultiplier * 2
        ),
        )
          ,)
      ),
    );
  }
}
