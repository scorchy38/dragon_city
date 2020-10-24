import 'package:flutter/material.dart';
import 'package:flutterdragoncity/constants.dart';
import 'package:flutterdragoncity/models/phone_code_json.dart';
import 'package:flutterdragoncity/screens/otp_screen.dart';
import 'package:flutterdragoncity/screens/profile_screen.dart';
import 'package:flutterdragoncity/size_config.dart';
import 'package:flutterdragoncity/widgets/custom_golden_button.dart';
class PhoneNumberWidget extends StatefulWidget {

  BuildContext context;
  PhoneNumberWidget(this.context);
  @override
  _PhoneNumberWidgetState createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {

  String selectedValue = CountryPhoneCode().jsonFile[0]['dial_code'];
  String phoneNumber;
  TextEditingController controller = TextEditingController();
  bool isValidated = false;

    void validateMobile() {
      if (controller.text.length == 0) {
        isValidated = false;
        Scaffold.of(widget.context).showSnackBar(
          SnackBar(content: Text('Enter Phone number'))
        );
      }
      else {
        isValidated = true;
        setState(() {
        });
      }
      return null;
    }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 5,
          width: SizeConfig.widthMultiplier* 80,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.white,
              )
            )
          ),
          child: Row(
            children: [
              Container(
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
              ),
              Container(
                width: SizeConfig.widthMultiplier * 45,
                height: SizeConfig.heightMultiplier * 4,
                child: TextField(
                  controller: controller,
                    keyboardType:  TextInputType.number,
                  style: normalTextStyle.copyWith(
                    fontSize: SizeConfig.textMultiplier * 2
                  ),
                  decoration: InputDecoration(
                    hintText: getTranslated(context, 'enter_ph_no'),
                    hintStyle: normalTextStyle.copyWith(
                      fontWeight: FontWeight.w300
                    ),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
              Expanded(child: Container(),),
              Icon(Icons.call,color: Colors.white,size: SizeConfig.imageSizeMultiplier * 5,)
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            validateMobile();
            if(isValidated) {
              String finalNumber = selectedValue + controller.text;
              print(finalNumber);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) =>
                      OtpPage(
                          phoneNum: finalNumber
                      ))
              );
            }
          },
          child: CustomGoldenButton(
            text: getTranslated(context, 'get_code'),
            style: normalTextStyle,
            width: 65,
            height: 5,
          ),
        )
      ],
    );
  }
}
