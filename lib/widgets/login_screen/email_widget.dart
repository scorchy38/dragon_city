import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/screens/profile_screen.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';

import '../../constants.dart';
import '../../size_config.dart';
class EmailLoginWidget extends StatefulWidget {


  @override
  _EmailLoginWidgetState createState() => _EmailLoginWidgetState();
}

class _EmailLoginWidgetState extends State<EmailLoginWidget> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  String loginEmail;

  String loginPassword;

  IconData passwordIcon = Icons.visibility;
  bool isIconChanged =false;

  Widget buildCustomRow(
      IconData icon,
      String title,
      bool obscure,
      TextInputType textInputType,
      TextEditingController controller)
  {
    return  Container(
      width: SizeConfig.widthMultiplier * 78,
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        keyboardType:  textInputType,
        style: normalTextStyle.copyWith(
            fontSize: SizeConfig.textMultiplier * 2
        ),
        onChanged: (_) {
          if(obscure)
            {
              if(!isIconChanged)
                setState(() {
                  isIconChanged = true;
                  passwordIcon = Icons.visibility_off;
                });
            }
        },
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
        onFieldSubmitted: (val) {
          if(obscure)
          {
            if(isIconChanged)
              setState(() {
                isIconChanged = false;
                passwordIcon = Icons.visibility;
              });
          }
        },
      ),
    );
  }

  void validateEntriesAndLogin(BuildContext context) async{
    if(_emailController.text.isNotEmpty && _passController.text.isNotEmpty)
      {
        loginEmail = _emailController.text.trim();
        loginPassword = _passController.text.trim();

        if(loginEmail.contains('@') && loginPassword.length >=6)
          {
            final String result = await AuthServices().signInWithEmailAndPassword(
              loginEmail,
              loginPassword
            );

            if(result == 'verified')
              {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/tab_screen', (Route<dynamic> route) => false);
                });
              }
          }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCustomRow(Icons.email, getTranslated(context, 'email_id'), false, TextInputType.emailAddress,_emailController),
        buildCustomRow(passwordIcon,getTranslated(context, 'password'), true, TextInputType.text,_passController),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(getTranslated(context, 'forgot_pass'),
          style: normalTextStyle.copyWith(
          ),),
        ),
        GestureDetector(
          onTap: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(
                 getTranslated(context, 'logging_in')))
            );
            validateEntriesAndLogin(context);
          },
          child: CustomGoldenButton(style: normalTextStyle,
          text: getTranslated(context, 'LOGIN'),
          height: 5,
          width: 65,),
        )
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