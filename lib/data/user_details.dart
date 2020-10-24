import 'package:flutter/material.dart';

class UserDetails{

  String username;
  String userPhoneNum;
  String userEmailID;
  String userDOB;
  String imageUrl;

  UserDetails({
    @required this.username,
    @required this.userPhoneNum,
    @required this.userEmailID,
    @required this.userDOB,
    @required this.imageUrl
});
}