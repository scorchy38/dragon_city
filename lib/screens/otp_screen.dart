import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/screens/homepage.dart';
import 'package:flutterdragoncity/screens/tab_screen.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';
import '../constants.dart';
class OtpPage extends StatefulWidget {

  String phoneNum;
  OtpPage({
    this.phoneNum
});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

  TextEditingController controller6 = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  FocusNode focusNode3 = FocusNode();

  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();

  FocusNode focusNode6 = FocusNode();

  String sentCode;
  String errorMsg;
  bool isValidated = false;
  bool isVerified = false;
  String verificationId;


  Widget buildCodeInputContainer(BuildContext context,
      FocusNode node,
      FocusNode nextNode,
      TextEditingController controller)
  {
    TextInputAction action;
      action = TextInputAction.done;
    return  Container(
      alignment: Alignment.center,
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.heightMultiplier * 6,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textInputAction: action,
        focusNode: node,
        onChanged: (value) {
          if(nextNode != null)
            FocusScope.of(context).requestFocus(nextNode);
        },
        textAlign: TextAlign.center,
        style: normalTextStyle.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.textMultiplier * 2.6
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
  }
  void validateEntries()
  async {
    if(controller1.text.isEmpty ||
        controller2.text.isEmpty ||
        controller3.text.isEmpty ||
        controller4.text.isEmpty ||
        controller5.text.isEmpty ||
        controller6.text.isEmpty)
      return;
    sentCode = controller1.text + controller2.text + controller3.text + controller4.text+
    controller5.text+controller6.text;
    if(sentCode.isEmpty)
    {
      isValidated =false;
      errorMsg = "Empty Field";
    }
    else {

      String result =  await AuthServices().signInWithOTpP(sentCode, verificationId);

      //Another better way to remove all screens upto particular one
      if(result == 'verified')
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/tab_screen', (Route<dynamic> route) => false);
        });
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

  }

  @override
  Widget build(BuildContext context) {
    if(!isVerified)
    verifyPhone(widget.phoneNum);
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (ctx)=>SingleChildScrollView(
            child: Container(
              height: SizeConfig.heightMultiplier * 100 ,
              decoration: BoxDecoration(
                gradient: backgroundGradient,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/vectors/otp_logo.png',
                        height: SizeConfig.heightMultiplier * 30,
                        width: SizeConfig.heightMultiplier * 30,
                      fit: BoxFit.cover,
                      scale: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: SizeConfig.heightMultiplier * 3,
                      width: SizeConfig.widthMultiplier * 60 ,
                      child: Text(
                        getTranslated(context, 'enter_code_received'),
                        style: normalTextStyle.copyWith(
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 8,
                      width: SizeConfig.widthMultiplier * 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildCodeInputContainer(context,  focusNode1,focusNode2, controller1),
                          buildCodeInputContainer(context, focusNode2,focusNode3,  controller2),
                          buildCodeInputContainer(context, focusNode3,focusNode4,  controller3),
                          buildCodeInputContainer(context, focusNode4,focusNode5,  controller4),
                          buildCodeInputContainer(context, focusNode5,focusNode6,  controller5),
                          buildCodeInputContainer(context, focusNode6, null, controller6),
                        ],
                      )
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        validateEntries();
                      },
                      child: CustomGoldenButton(
                        style: normalTextStyle,
                        width: 65,
                        height: 6,
                        text: getTranslated(context, 'verify'),
                      ),
                    )
                    ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: SizeConfig.heightMultiplier * 30,
                      width: SizeConfig.widthMultiplier * 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              getTranslated(context, 'not_receive_code'),
                            style: normalTextStyle.copyWith(
                              letterSpacing: 1.2,
                              fontSize: SizeConfig.textMultiplier * 1.5,
                              fontWeight: FontWeight.w400
                            )
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isVerified = false;
                                    });
                                    Scaffold.of(ctx).showSnackBar(
                                      SnackBar(content: Text(getTranslated(context, 'code_has_resend')))
                                    );
                                  },
                                  child: Text(
                                    getTranslated(context, 'resend_code'),
                                    style: normalTextStyle,
                                  ),
                                ),
                                VerticalDivider(
                                    thickness: 1,
                                    width: 1,
                                    color: Colors.white
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    getTranslated(context, 'change_no'),
                                    style: normalTextStyle,
                                  ),
                                ),
                              ]
                            ),
                          )
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
  Future<void> verifyPhone(phoneNo) async{

    final PhoneCodeAutoRetrievalTimeout timeout = (String verId) {
      verificationId = verId;
    };

    final PhoneVerificationCompleted verified = (AuthCredential authResult){
      setState(() {
        isVerified = true;
      });
    };
    final PhoneVerificationFailed unverified = (FirebaseAuthException authResult){
      print('${authResult.message}');
    };

    final PhoneCodeSent codeSent = (String verId,[int forceResend]){
      verificationId = verId;

    };
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: unverified,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: timeout);
  }
}
