import 'package:flutter/material.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';

import '../../constants.dart';
import '../../size_config.dart';
class EmailLoginWidget extends StatelessWidget {
  
  
  Widget buildCustomRow(IconData icon,String title,bool obscure,TextInputType textInputType)
  {
    return  Container(
      width: SizeConfig.widthMultiplier * 78,
      child: TextFormField(
        obscureText: obscure,
        keyboardType:  textInputType,
        style: normalTextStyle.copyWith(
            fontSize: SizeConfig.textMultiplier * 2
        ),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: normalTextStyle,
          suffixIcon: Icon(icon,color: Colors.white,size:  SizeConfig.imageSizeMultiplier * 6,),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2
            )
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  width: 2
              )
          ),
          focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  width: 2
              )
          ),
          focusedErrorBorder: InputBorder.none,
        ),
        onChanged: (value) {
          //print(value);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCustomRow(Icons.email, "Email Id", false, TextInputType.emailAddress),
        buildCustomRow(Icons.remove_red_eye, "Password", true, TextInputType.text),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Forgot Password?',
          style: normalTextStyle.copyWith(
          ),),
        ),
        CustomGoldenButton(style: normalTextStyle,
        text: 'LOGIN',
        height: 5,
        width: 65,)
      ]
    );
  }
}
//Container(
//height: SizeConfig.heightMultiplier * 7,
//width: SizeConfig.widthMultiplier* 80,
//decoration: BoxDecoration(
//border: Border(
//bottom: BorderSide(
//width: 2,
//color: Colors.white,
//)
//)
//),