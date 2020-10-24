import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/models/phone_code_json.dart';
import 'package:flutterdragoncity/screens/profile_screen.dart';
import 'package:flutterdragoncity/screens/tab_screen.dart';
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
  String selectedValue = CountryPhoneCode().jsonFile[0]['dial_code'];

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasController;
  TextEditingController mobileNumController;
  TextEditingController DOBController ;

  FirebaseFirestore _firestore;
  List<String> dob = [];

  Widget buildCustomRow(
      String label,
      bool obscure,
      TextInputType textInputType,
      TextEditingController controller,
      bool isPrefix
      )
  {
    return Container(
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
              prefix: isPrefix? Container(
                height: SizeConfig.heightMultiplier * 2.5,
                width: SizeConfig.widthMultiplier * 18,
                child: DropdownButton<String>(
                  hint: Text('+00',style: normalTextStyle.copyWith(
                      fontSize: SizeConfig.textMultiplier * 2
                  ),),
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  iconSize: 22,
                  isDense: true,
                  dropdownColor: Colors.red,
                  underline: SizedBox(),
                  value: selectedValue,
                  style: normalTextStyle,
                  onChanged: (String value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  items: CountryPhoneCode().jsonFile.map((dynamic cc) {
                    return DropdownMenuItem<String>(
                      value: cc['dial_code'],
                      child: Text(
                        '${cc['dial_code']}',
                        style: normalTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.textMultiplier * 2
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ):Container(
                height: 0,
                width: 0,
              ),
              labelText: label,
              labelStyle: normalTextStyle,
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


  void createAccount() async
  {
    fullName = nameController.text;
    email = emailController.text;
    mobileNumber = mobileNumController.text;
    DOB  =DOBController.text;
    password = passwordController.text;
    confirmPassword = confirmPasController.text;

    final String result = await AuthServices().signUpWithEmailAndPassword(email, password);
    if(result == 'verified')
      {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/tab_screen', (Route<dynamic> route) => false);
        });

        final user = FirebaseAuth.instance.currentUser;
        _firestore = FirebaseFirestore.instance;
        _firestore.collection('user').doc(user.uid).set({
          'Name' : fullName,
          'Email Id' :email,
          'Password': password,
          'Mobile No': mobileNumber,
          'DOB': DOB,
          'ImageUrl': null
        });
      }
    else
    {
      showCupertinoDialog(context: context,
          builder: (ctx)=> CupertinoAlertDialog(
            content: Text('$result HAS OCCURRED. PLEASE TRY AGAIN.',
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 3
                )),
            title: Text("Attention!",style: TextStyle(fontSize:SizeConfig.textMultiplier * 3),),
            actions: <Widget>[
              FlatButton(
                child: Text("Done",style: TextStyle(fontSize:SizeConfig.textMultiplier * 3,
                    color: Colors.blue)
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
    }

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
                      getTranslated(context, 'create_account'),
                      style: shojuTextStyle,
                    ),
                  ),
                  buildCustomRow(getTranslated(context, 'full_name'), false, TextInputType.text,nameController,false),
                  buildCustomRow(getTranslated(context, 'email'), false, TextInputType.emailAddress,emailController,false),
                  buildCustomRow(getTranslated(context, 'mob_no'), false,  TextInputType.number,mobileNumController,true),
                  buildDOBcontainer(),
                  buildCustomRow(getTranslated(context, 'password'), true, TextInputType.text,passwordController,false),
                  buildCustomRow(getTranslated(context, 'confirm_pass'), true, TextInputType.text,confirmPasController,false),
                  GestureDetector(
                    onTap: () {
                      createAccount();
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomGoldenButton(
                        text: getTranslated(context, 'create_account_c'),
                        width: 65,
                        height: 5,
                        style: normalTextStyle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                      child: GestureDetector(
                        onTap:  () {
                          Navigator.of(context).pushNamed(
                            TabScreen.routename
                          );
                        },
                        child: Text(getTranslated(context, 'skip'),
                        style: normalTextStyle,
                        ),
                      )),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: SizeConfig.widthMultiplier * 50,
                        child: RichText(
                          text: TextSpan(
                            text: getTranslated(context, 'registering'),
                            style: normalTextStyle.copyWith(
                              fontSize: SizeConfig.heightMultiplier * 1.2,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            ),
                            children: [
                              TextSpan(
                                text: getTranslated(context, 'terms_cond'),
                                style: normalTextStyle.copyWith(
                                  fontSize: SizeConfig.textMultiplier * 1.2,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.yellow,
                                )
                              ),
                              TextSpan(
                                  text: getTranslated(context, 'and'),
                                  style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  )
                              ),
                              TextSpan(
                                  text: getTranslated(context, 'privacy_policy'),
                                  style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 1.2,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.yellow,
                                  )
                              ),
                              TextSpan(
                                  text: getTranslated(context,'of_the'),
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

  Widget buildDOBcontainer()
  {
    return GestureDetector(
      onTap: () async{
        await showDatePicker(context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2021)
        ).then((value) {

          if(value != null) {
            dob = value.toString().split(' ');
            setState(() {});
          }
        });
      },
      child: Container(
          width: double.infinity,
          height: SizeConfig.heightMultiplier * 7,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.white,
                      width: 0.5,
                      style: BorderStyle.solid
                  )
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                getTranslated(context,'dob'),
                style: dob.length > 0 ? normalTextStyle.copyWith(
                  fontSize: SizeConfig.textMultiplier * 1.5,
                ): normalTextStyle
              ),
              dob.length > 0 ?Text(
                '${dob[0]}',
                style: normalTextStyle,
              ):SizedBox()
            ],
          )
      ),
    );
  }
}
