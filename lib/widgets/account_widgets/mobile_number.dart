import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/border_container.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditMobileNumber extends StatefulWidget {
  final bool isExpanded;
  final FToast toast;

  EditMobileNumber({this.isExpanded, this.toast});

  @override
  _EditMobileNumberState createState() => _EditMobileNumberState();
}

class _EditMobileNumberState extends State<EditMobileNumber> {
  TextEditingController prevNumController = TextEditingController();
  TextEditingController newNumController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;


  _showToast(String message)
  {

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent[200],
      ),
      child: Text(message,style: normalTextStyle.copyWith(
          color: Colors.black
      ),
      ),
    );


    widget.toast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );

  }

  void updatePhoneNumber() async {
    if(_auth.currentUser!=null) {
      if (prevNumController.text.isNotEmpty) {
          if (newNumController.text.isNotEmpty) {
            await FirebaseFirestore.instance.
            collection('users').doc(_auth.currentUser.uid)
                .update({
              'Mobile No': newNumController.text
            }).whenComplete(() {
              _showToast('Phone Number updated successfully.');
            });
          }
          else
            _showToast(getTranslated(context, 'new_phn'));
        } else
          _showToast(getTranslated(context, 'prev_phn'));

      }
        else
      _showToast(getTranslated(context, 'need_login'));

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: widget.isExpanded ? SizeConfig.heightMultiplier * 23 : 0,
      width: SizeConfig.widthMultiplier * 80,
      child: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightMultiplier * 23,
          child: Row(
            children: [
              Spacer(
                flex: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                   getTranslated(context, 'prev_phn'),
                    style: normalTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.textMultiplier * 2),
                  ),
                  BorderedContainer(
                    height: 6,
                    width: 70,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(216, 216, 216, 1),
                              width: 0.6),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              SizeConfig.heightMultiplier * 1.1,
                            ),
                          )),
                      height: SizeConfig.heightMultiplier * 6,
                      width: SizeConfig.widthMultiplier * 50,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                '+456 ',
                                style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 2,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(32, 32, 32, 1)),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 1,
                              color: Color.fromRGBO(32, 32, 32, 1),
                            ),
                            Container(
                              height: SizeConfig.heightMultiplier * 3.2,
                              width: SizeConfig.widthMultiplier * 40,
                              child: TextField(
                                controller: prevNumController,
                                keyboardType: TextInputType.number,
                                style: normalTextStyle.copyWith(
                                    fontSize: SizeConfig.textMultiplier * 2,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(32, 32, 32, 1)),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Text(
                   getTranslated(context, 'new_phn'),
                    style: normalTextStyle.copyWith(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.textMultiplier * 2),
                  ),
                  BorderedContainer(
                    height: 6,
                    width: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: SizeConfig.heightMultiplier * 6,
                          width: SizeConfig.widthMultiplier * 58,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(216, 216, 216, 1),
                                  width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  SizeConfig.heightMultiplier * 1.1,
                                ),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '+456 ',
                                    style: normalTextStyle.copyWith(
                                        fontSize: SizeConfig.textMultiplier * 2,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(32, 32, 32, 1)),
                                  ),
                                  margin: EdgeInsets.only(
                                      left: SizeConfig.widthMultiplier * 2),
                                ),
                                Container(
                                  height: SizeConfig.heightMultiplier * 4.5,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Color.fromRGBO(32, 32, 32, 1),
                                  ),
                                ),
                                Container(
                                  height: SizeConfig.heightMultiplier * 3.2,
                                  width: SizeConfig.widthMultiplier * 35,
                                  child: TextField(
                                    controller: newNumController,
                                    keyboardType: TextInputType.number,
                                    style: normalTextStyle.copyWith(
                                        fontSize: SizeConfig.textMultiplier * 2,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(32, 32, 32, 1)),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            updatePhoneNumber();
                          },
                          child: Container(
                              height: SizeConfig.heightMultiplier * 4,
                              width: SizeConfig.widthMultiplier * 10,
                              child: Icon(
                                Icons.check,
                                color: Colors.lightGreen,
                                size: SizeConfig.heightMultiplier * 4,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
