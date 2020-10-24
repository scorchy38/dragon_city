import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterdragoncity/data/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices with ChangeNotifier{

  DocumentSnapshot documentSnapshot;
  UserDetails userDetails;
  StorageReference storageReference;
  String profileImageLink;
  SharedPreferences prefs;
  String locale;
  signOut() async
  {
    await FirebaseAuth.instance.signOut().then((value) => print('Signed Out'));
  }

  Future<String>signIn(AuthCredential authCreds) async
  {
    String returnMessage = 'verified';
    try {
      await FirebaseAuth.instance.signInWithCredential(authCreds);
    } catch(error)
    {
      return returnMessage = error.toString();
    }
    return returnMessage;
  }

  Future<String> signInWithOTpP(smsCode,verificationId) async
  {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode);
    String resultMsg = await signIn(authCreds);
    return resultMsg;
  }

  Future<String> signUpWithEmailAndPassword(email,password) async{

    String returnMessage = 'verified';
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch(error)
    {
      return returnMessage = error.toString();
    }
    return returnMessage;
  }
  Future<String> signInWithEmailAndPassword(email,password) async{

    String returnMessage = 'verified';
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch(error)
    {
      return returnMessage = error.toString();
    }
    return returnMessage;
  }


  Future<void> getUserData(String userUID) async{
    try {
      documentSnapshot = await  FirebaseFirestore.instance.collection('user')
          .doc(userUID).get();
      if(documentSnapshot.get('ImageUrl') == null)
        userDetails = UserDetails(
            username: documentSnapshot.get('Name'),
            userPhoneNum: documentSnapshot.get("Mobile No"),
            userEmailID: documentSnapshot.get('Email Id'),
            userDOB: documentSnapshot.get('DOB'),
        imageUrl: null);
      else
      userDetails = UserDetails(
          username: documentSnapshot.get('Name'),
          userPhoneNum: documentSnapshot.get("Mobile No"),
          userEmailID: documentSnapshot.get('Email Id'),
          userDOB: documentSnapshot.get('DOB'),
        imageUrl: documentSnapshot.get('ImageUrl')
      );
      notifyListeners();
    } catch(error)
    {
      print(error);
    }
  }
}
// FORE EXPIRY SESSON TIME INFORMATION. You can set a timer to that time

//final user = await FirebaseAuth.instance.currentUser();
//final idToken = await user.getIdToken();
//final token = idToken.token;