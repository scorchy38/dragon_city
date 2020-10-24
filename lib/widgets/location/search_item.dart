import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';
class SearchItem extends StatelessWidget {
  final int id;
  final String imagePath;
  final String title;
  final String category;
  final String steps;
  final String time;
  Function navigator;

  SearchItem({
    this.id,
    this.title,
    this.imagePath,
    this.category,
    this.steps,
    this.time,
    this.navigator
});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightMultiplier * 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(
                    SizeConfig.heightMultiplier * 1.5)),
                child: Image.asset(imagePath,
                  height: SizeConfig.heightMultiplier * 7,
                  width: SizeConfig.heightMultiplier * 7,
                fit: BoxFit.cover,
                )
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 2.5,),
              Expanded(
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 2,
                          child: Text(
                            title,
                            style: normalTextStyle.copyWith(
                              fontWeight: FontWeight.w300,
                              color: Colors.black
                            ),
                          )
                        ),
                        Container(
                            height: SizeConfig.heightMultiplier * 3.5,
                            child: Row(
                              children: [
                                Text(
                                  category,
                                  style: normalTextStyle.copyWith(
                                      color: Colors.black,
                                      fontSize: SizeConfig.textMultiplier * 1.7
                                  ),
                                ),
                                Spacer(flex: 1,),
                                Container(
                                  height: SizeConfig.heightMultiplier * 3.5,
                                  width: SizeConfig.widthMultiplier * 18,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                          Icons.directions_walk,
                                     color: Colors.red,
                                      size: SizeConfig.heightMultiplier * 1.7,),

                                      Text(
                                        '$steps steps',
                                        style: normalTextStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontSize: SizeConfig.textMultiplier * 1.3
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(flex: 1,),
                                Container(
                                  height: SizeConfig.heightMultiplier * 3.5,
                                  width: SizeConfig.widthMultiplier * 15,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.watch_later,
                                        color: Colors.red,
                                        size: SizeConfig.heightMultiplier * 1.7,),

                                      Text(
                                        '$time min',
                                        style: normalTextStyle.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.textMultiplier * 1.3
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
                  if(id==1)
                    {
                      navigator(1);
                      Navigator.of(context).pop();
                    }
                },
                child: Container(
                    height: SizeConfig.heightMultiplier * 3.5,
                    width: SizeConfig.widthMultiplier * 25,
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
                          size: SizeConfig.heightMultiplier * 2,
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier *1.5,),
                        Text(
                          'Navigate',
                          style: normalTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.5,
                          ),
                        )
                      ],
                    )
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.grey[500],
            thickness: 1,
          )
        ],
      ),
    );
  }
}
