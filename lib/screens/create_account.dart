import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/screens/profile_screen.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';
class CreateNewAccount extends StatefulWidget {

  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  String email;
  String fullName;
  String password;
  String confirmPassword;
  String mobileNumber;
  String DOB;

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasController;
  TextEditingController mobileNumController;
  TextEditingController DOBController ;



  Widget buildCustomRow(
      String label,
      bool obscure,
      TextInputType textInputType,
      TextEditingController controller,
      bool isPrefix
      )
  {
    return  Container(
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType:  textInputType,
        style: normalTextStyle.copyWith(
          color: Colors.white,
            fontSize: SizeConfig.textMultiplier * 2,
          fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: normalTextStyle,
          prefix: isPrefix? Container(
            child: Text('+456 ',style: normalTextStyle,),
          ):Container(
            height: 0,
              width: 0,
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1
              )
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1
              )
          ),
          focusedBorder:  UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1
              )
          ),
          focusedErrorBorder: InputBorder.none,
        ),
        onChanged: (value) {
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileNumController = TextEditingController();
    DOBController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasController = TextEditingController();
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileNumController.dispose();
    DOBController.dispose();
    passwordController.dispose();
    confirmPasController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var safeAreaVertical = MediaQuery.of(context).padding.top;
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: SizeConfig.heightMultiplier * 100 - safeAreaVertical,
            decoration: BoxDecoration(
              gradient: backgroundGradient
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.heightMultiplier * 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: SizeConfig.heightMultiplier * 10,
                    width: SizeConfig.widthMultiplier *50,
                    child: Text(
                      'Create Account',
                      style: shojuTextStyle,
                    ),
                  ),
                  buildCustomRow('Full Name', false, TextInputType.text,nameController,false),
                  buildCustomRow('Email', false, TextInputType.emailAddress,emailController,false),
                  buildCustomRow('Mobile Number', false,  TextInputType.number,mobileNumController,true),
                  buildCustomRow('Date of Birth', false, TextInputType.text,DOBController,false),
                  buildCustomRow('Password', true, TextInputType.text,passwordController,false),
                  buildCustomRow('Confirm Password', true, TextInputType.text,confirmPasController,false),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx)=> UserProfile())
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomGoldenButton(
                        text: 'Create Account',
                        width: 65,
                        height: 5,
                        style: normalTextStyle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                      child: Text('SKIP',
                      style: normalTextStyle,
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: SizeConfig.widthMultiplier * 50,
                        child: RichText(
                          text: TextSpan(
                            text: 'By registering to the ',
                            style: normalTextStyle.copyWith(
                              fontSize: SizeConfig.heightMultiplier * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: normalTextStyle.copyWith(
                                  fontSize: SizeConfig.textMultiplier * 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.yellow,
                                )
                              ),
                              TextSpan(
                                  text: ' and ',
                                  style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  )
                              ),
                              TextSpan(
                                  text: 'Privacy Policy ',
                                  style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.yellow,
                                  )
                              ),
                              TextSpan(
                                  text: 'of the Dragon City Bahrain.',
                                  style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  )
                              )
                            ]
                          ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
