import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class ExploreScreen extends StatefulWidget {

  final int id;

  ExploreScreen({
    this.id,
});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  PageController _pageController;
  PageController _pageController2;
  double catHeight = 100;
  double catWidth = 400;

  List<String> titles =  [
    'Electronics',
    'Home Furniture',
    'Lightening',
    'Furniture',
    'Toys'
  ];

  List<String> imagePaths =  [
    'assets/images/shop_detail.png',
    'assets/images/shop_kitchen.png',
    'assets/images/shop_toys.png',
    'assets/images/shop_kitchen.png',
    'assets/images/shop_carpet.png',
    'assets/images/shop_detail.png',
    'assets/images/shop_kitchen.png',
    'assets/images/shop_toys.png',
    'assets/images/shop_kitchen.png',
    'assets/images/shop_carpet.png',
  ];

  _titleSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {

          value = _pageController.page - index ;
          value = (0.8- (value.abs() * 0.2) + 0.04).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * catHeight ,
            width: Curves.easeInOut.transform(value) * catWidth,
            child: widget,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(147,105,36,1),
            width: 2
          ),
          borderRadius: BorderRadius.all(Radius.circular(
            SizeConfig.heightMultiplier
          )),
        ),
        alignment: Alignment.center,
        child: Text(titles[index],
        style: shojuTextStyle.copyWith(
          color: Color.fromRGBO(147,105,36,1),
          fontSize: SizeConfig.textMultiplier * 2.5
        ),),
      )
    );
  }

  _imageSelector(int index) {
    return AnimatedBuilder(
        animation: _pageController2,
        builder: (BuildContext context, Widget widget) {
          double value = 1;
          if (_pageController2.position.haveDimensions) {

            value = _pageController2.page - index ;
            value = (0.8- (value.abs() * 0.2) + 0.04).clamp(0.0, 1.0);
          }
          return Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(value) * SizeConfig.heightMultiplier * 50 ,
              width: Curves.easeInOut.transform(value) * SizeConfig.widthMultiplier * 85,
              child: widget,
            ),
          );
        },
        child:GestureDetector(
          onTap: () {},
          child: Stack(
            children: <Widget>[
               Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: AssetImage(imagePaths[index]),
                        height: SizeConfig.heightMultiplier * 50.0,
                        width: SizeConfig.widthMultiplier * 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              Positioned(
                left: SizeConfig.widthMultiplier * 36,
                bottom: SizeConfig.heightMultiplier * 4,
                child: Text(
                    '52',
                    style: normalTextStyle.copyWith(
                      fontSize: SizeConfig.textMultiplier * 3
                    )
                ),
              ),
              Positioned(
                left: SizeConfig.widthMultiplier * 3,
                bottom: SizeConfig.heightMultiplier * 2,
                child: Text(
                    'Asna Home Decoration Bahrain Co. W.L.L',
                    style: normalTextStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 2.2
                    )
                ),
              ),
            ],
          ),
        ),
    );
  }
  @override
  void initState() {
    super.initState();
    //initialPage sets which page remains highlighted and in center
    _pageController = PageController(initialPage: 1, viewportFraction: 0.6);
    _pageController2 =  PageController(initialPage: 1, viewportFraction: 0.75);
    catHeight = SizeConfig.heightMultiplier * 8;
    catWidth = SizeConfig.widthMultiplier * 65;
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: double.infinity,
        child: Column(
          children: [
            Container(
                height: SizeConfig.heightMultiplier * 15,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight:
                        Radius.circular(SizeConfig.heightMultiplier * 3),
                        bottomLeft:
                        Radius.circular(SizeConfig.heightMultiplier * 3)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromRGBO(131, 1, 1, 1),
                          Color.fromRGBO(235, 28, 34, 1)
                        ])),
                child: Padding(
                  padding:  EdgeInsets.all(SizeConfig.heightMultiplier),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Image.asset('assets/vectors/chev.png',
                            height: SizeConfig.heightMultiplier * 2.5,
                            width: SizeConfig.widthMultiplier * 3,
                          ),
                          onPressed: () {
//                        Navigator.of(context).pop();
                      }),
                      Spacer(flex: 1,),
                      Text(
                        'Shops',
                        style: shojuTextStyle.copyWith(
                          fontSize: SizeConfig.textMultiplier * 3.3,
                        ),
                      ),
                      Spacer(flex: 1,),
                      IconButton(
                          icon: Image.asset('assets/vectors/search_2.png',
                            height: SizeConfig.heightMultiplier * 2.6,
                            width: SizeConfig.widthMultiplier * 5.2,
                          ),
                          onPressed: () {
                          })
                    ],
                  ),
                )
            ),
          SizedBox(
            height: SizeConfig.heightMultiplier * 2,
          ),
          Container(
            height: SizeConfig.heightMultiplier  * 10,
             child: PageView.builder(
              controller: _pageController,
              itemCount: titles.length,
              itemBuilder: (BuildContext context, int index) {
                return _titleSelector(index);
              },
            ),
          ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Container(
              height: SizeConfig.heightMultiplier  * 50,
              child: PageView.builder(
                controller: _pageController2,
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return _imageSelector(index);
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                  height: SizeConfig.heightMultiplier * 6,
                  width: SizeConfig.widthMultiplier * 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5*SizeConfig.heightMultiplier)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3,0.8],
                        colors: [
                          Color.fromRGBO(131,1,1,1),
                          Color.fromRGBO(221,48,45,1),

                        ]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_walk,color: Colors.white,
                        size: SizeConfig.heightMultiplier * 3,
                      ),
                      SizedBox(width: SizeConfig.widthMultiplier * 3,),
                      Text(
                        'Navigate',
                        style: normalTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: SizeConfig.textMultiplier * 2,
                        ),
                      )
                    ],
                  )
              ),
            ),
            SizedBox(height : SizeConfig.heightMultiplier * 5,),
            SmoothPageIndicator(
                controller: _pageController2,  // PageController
                count:  10,
                effect:  ExpandingDotsEffect(),  // your preferred effect
                onDotClicked: (index){
                }
            )
        ]
      ),
    )
    );
  }
}
