import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomBottomBar extends StatefulWidget {

  final int pageIndex;
  final Function changePage;

  CustomBottomBar(
  {
    this.pageIndex,
    this.changePage
});
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar>
    with SingleTickerProviderStateMixin {


  double alignmentPosition = -SizeConfig.widthMultiplier/10.5;
  AnimationController controller;
  Animation animation;
  Animation<Color> colorAnim1, colorAnim2, colorAnim3;
  LinearGradient backGrad = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(235, 28, 34, 1),
        Color.fromRGBO(131, 1, 1, 0.88),
        Color.fromRGBO(207, 22, 26, 1),
      ]);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween(begin: -SizeConfig.widthMultiplier/10.5, end: 0.0).animate(controller);
    colorAnim1 =
        ColorTween(begin: Colors.black, end: Colors.white).animate(controller);
    colorAnim2 =
        ColorTween(begin: Colors.white, end: Colors.black).animate(controller);
    colorAnim3 =
        ColorTween(begin: Colors.white, end: Colors.black).animate(controller);

    animation.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: SizeConfig.heightMultiplier * 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.heightMultiplier * 10),
          bottomLeft: Radius.circular(SizeConfig.heightMultiplier * 0.7),
          topRight: Radius.circular(SizeConfig.heightMultiplier * 10),
          bottomRight: Radius.circular(SizeConfig.heightMultiplier * 0.7),
        ),
      ),
      child: Stack(
        alignment: Alignment(animation.value, -1),
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(

                height: SizeConfig.heightMultiplier * 7,
                width: SizeConfig.widthMultiplier * 70,
                decoration: BoxDecoration(
                  gradient: backGrad,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeConfig.heightMultiplier * 5.5),
                    bottomLeft: Radius.circular(SizeConfig.heightMultiplier * 0.7),
                    topRight: Radius.circular(SizeConfig.heightMultiplier * 5.5),
                    bottomRight: Radius.circular(SizeConfig.heightMultiplier * 0.7),
                  ),
                )),
          ),
          Container(
            height: SizeConfig.heightMultiplier * 6,
            width: SizeConfig.heightMultiplier * 6.5,
            child: CustomPaint(
              painter: NavigationItemPainter(),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: GestureDetector(
              onTap: () {
                if(alignmentPosition == -SizeConfig.widthMultiplier/10.5)
                {
                  colorAnim1 = ColorTween(
                      begin: Colors.black, end: Colors.white)
                      .animate(controller);
                  colorAnim2 = ColorTween(
                      begin: Colors.white, end: Colors.black)
                      .animate(controller);
                  colorAnim3 = ColorTween(
                      begin: Colors.white, end: Colors.white)
                      .animate(controller);

                }
                else
                if(alignmentPosition == SizeConfig.widthMultiplier/10.5)
                {
                  colorAnim3 = ColorTween(
                      begin: Colors.black, end: Colors.white)
                      .animate(controller);
                  colorAnim2 = ColorTween(
                      begin: Colors.white, end: Colors.black)
                      .animate(controller);
                  colorAnim1 = ColorTween(
                      begin: Colors.white, end: Colors.white)
                      .animate(controller);

                }
                animation = Tween(begin: alignmentPosition, end: 0.0)
                    .animate(controller);
                alignmentPosition = 0.0;
                widget.changePage(1);
                setState(() {

                });
                if(controller.status == AnimationStatus.completed)
                  controller.reset();

                controller.forward();
              },
              child: Container(
                height: SizeConfig.heightMultiplier * 4.5,
                width: SizeConfig.widthMultiplier * 14,
                color: Colors.transparent,
                child: Icon(
                  Icons.location_on,
                  color: colorAnim2.value,
                  size: SizeConfig.heightMultiplier * 3,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(SizeConfig.widthMultiplier/10.5, 0),
            child: GestureDetector(
              onTap: () {
                if(alignmentPosition == -SizeConfig.widthMultiplier/10.5)
                {
                  colorAnim1 = ColorTween(
                      begin: Colors.black, end: Colors.white)
                      .animate(controller);
                  colorAnim3 = ColorTween(
                      begin: Colors.white, end: Colors.black)
                      .animate(controller);
                  colorAnim2 = ColorTween(
                      begin: Colors.white, end: Colors.white)
                      .animate(controller);

                }
                else
                if(alignmentPosition == 0.0)
                {
                  colorAnim2 = ColorTween(
                      begin: Colors.black, end: Colors.white)
                      .animate(controller);
                  colorAnim3 = ColorTween(
                      begin: Colors.white, end: Colors.black)
                      .animate(controller);
                  colorAnim1 = ColorTween(
                      begin: Colors.white, end: Colors.white)
                      .animate(controller);

                }
                animation = Tween(begin: alignmentPosition, end: SizeConfig.widthMultiplier/10.5)
                    .animate(controller);
                alignmentPosition = SizeConfig.widthMultiplier/10.5;
                widget.changePage(2);
                setState(() {

                });
                if(controller.status == AnimationStatus.completed)
                  controller.reset();
                controller.forward();
              },
              child: Container(
                height: SizeConfig.heightMultiplier * 4.5,
                width: SizeConfig.widthMultiplier * 14,
                color: Colors.transparent,
                child: Icon(
                  Icons.person,
                  color: colorAnim3.value,
                  size:  SizeConfig.heightMultiplier * 3,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-SizeConfig.widthMultiplier/10.5, 0),
            child: GestureDetector(
              onTap: () {

                if(alignmentPosition == SizeConfig.widthMultiplier/10.5)
                {
                  colorAnim1 = ColorTween(
                      begin: Colors.white, end: Colors.black)
                      .animate(controller);
                  colorAnim3 = ColorTween(
                      begin: Colors.black, end: Colors.white)
                      .animate(controller);
                  colorAnim2 = ColorTween(
                      begin: Colors.white, end: Colors.white)
                      .animate(controller);

                }
                else
                if(alignmentPosition == 0.0)
                {
                  colorAnim2 = ColorTween(
                      begin: Colors.black, end: Colors.white)
                      .animate(controller);
                  colorAnim1 = ColorTween(
                      begin: Colors.white, end: Colors.black)
                      .animate(controller);
                  colorAnim3 = ColorTween(
                      begin: Colors.white, end: Colors.white)
                      .animate(controller);

                }
                animation = Tween(begin: alignmentPosition, end: -SizeConfig.widthMultiplier/10.5)
                    .animate(controller);
                alignmentPosition = -SizeConfig.widthMultiplier/10.5;
                widget.changePage(0);
                setState(() {

                });
                if(controller.status == AnimationStatus.completed)
                  controller.reset();
                controller.forward();
              },
              child: Container(
                height: SizeConfig.heightMultiplier * 4.5,
                width: SizeConfig.widthMultiplier * 14,
                color: Colors.transparent,
                child: Icon(
                  Icons.home,
                  color: colorAnim1.value,
                  size: SizeConfig.heightMultiplier * 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//Custom Painter class for bottom bar
class NavigationItemPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    double radius = size.width/2;
    Offset center = Offset(radius,radius);


    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    Path path = new Path();
    path.moveTo(0,0);
    path.lineTo(radius * 2,0);
    path.quadraticBezierTo(radius + (radius/4), radius - (radius/2 + radius/3 + radius/4), radius + (radius/2 + radius/10), radius/2);
    path.lineTo(radius - (radius/2 + radius/10), radius/2 );
    path.quadraticBezierTo(radius - (radius/4), radius -(radius/2 + radius/3 + radius/4), 0,0);



    Paint criclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 6;

    Paint midCirclePaint = Paint()
      ..shader = RadialGradient(
          colors: [Color.fromRGBO(218,193,108,0.5), Color.fromRGBO(234,172,74,1)]).
      createShader(
          Rect.fromCircle(radius: radius, center: center))
      ..style = PaintingStyle.fill
      ..strokeWidth = 6;


    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(radius , radius), radius/2 + radius/4, criclePaint);
    canvas.drawCircle(Offset(radius , radius), radius/3 + radius/3 , midCirclePaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
