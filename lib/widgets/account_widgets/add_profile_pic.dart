import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragoncity/models/auth_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class AddProfilePicture extends StatefulWidget {

  //TODO: Get context of scaffold
  final String name;
  final String imageLink;

  AddProfilePicture({
    this.name,
    this.imageLink
});
  @override
  _AddProfilePictureState createState() => _AddProfilePictureState();
}

class _AddProfilePictureState extends State<AddProfilePicture> {

  File _pickedImage;
  String pathName;
  StorageReference _storageReference;
  FirebaseAuth _auth;


  Future<void> selectGallery() async{
    final file=await ImagePicker().getImage(
        source: ImageSource.gallery,maxWidth: 1024,maxHeight: 1024);
    if(file==null)
      return;
    final _imageTaken = File(file.path);
    final appDir=await syspaths.getApplicationDocumentsDirectory();
     pathName=path.basename(_imageTaken.path);
    _pickedImage = await _imageTaken.copy("${appDir.path}/$pathName");
  }

  @override
  void initState() {
    super.initState();
  }

  void uploadProfileImage() async
  {
    _auth = FirebaseAuth.instance;
    if(_auth.currentUser!=null) {
      if (_pickedImage != null) {
        _storageReference =
            FirebaseStorage.instance.ref().child(
                "userProfileImage/${_auth.currentUser.uid}/$pathName");
        final StorageUploadTask uploadTask = _storageReference.putFile(
            _pickedImage);
        final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
        final String url = (await downloadUrl.ref.getDownloadURL());
        FirebaseFirestore.instance.collection('user').doc(_auth.currentUser.uid).update({
          'ImageUrl':url
        });
        Provider.of<AuthServices>(context,listen: false).getUserData(_auth.currentUser.uid);
      }
    }
    else
      {
        //Show Toast that not logged in
      }

  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: SizeConfig.heightMultiplier * 3,),
        Stack(
          alignment: Alignment(1.2,0.5),
          children: [
            Container(
              height: SizeConfig.heightMultiplier * 15,
              width: SizeConfig.heightMultiplier * 15,
              decoration: BoxDecoration(
                color: Color.fromRGBO(228,228,228,1),
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.heightMultiplier * 8)
                ),
              ),
              child: widget.imageLink == null ? _pickedImage == null?
              Icon(Icons.person,color: Colors.black,
                  size: SizeConfig.heightMultiplier * 12,):
                ClipRRect(
                  borderRadius:  BorderRadius.all(
                  Radius.circular(SizeConfig.heightMultiplier * 8)
                  ),
                    child:Image.file(_pickedImage,fit: BoxFit.cover,)
                ):
              ClipRRect(
                  borderRadius:  BorderRadius.all(
                      Radius.circular(SizeConfig.heightMultiplier * 8)
                  ),
                  child:Image.network(widget.imageLink,fit: BoxFit.cover,)
              )
            ),
            GestureDetector(
              onTap: () {
                selectGallery().then((value) {
                  uploadProfileImage();
                  setState(() {});
                });


              },
              child: Container(
                  height: SizeConfig.heightMultiplier * 3.2,
                  width: SizeConfig.heightMultiplier * 3.2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(214,186,89,1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _pickedImage == null?Icons.add : Icons.edit,
                    size: SizeConfig.imageSizeMultiplier * 5,
                    color: Color.fromRGBO(43,43,43,1),
                  )),
            )
          ],
        ),
        Text(
          widget.name,
          style: normalTextStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: SizeConfig.textMultiplier * 3,
          ),
        )
      ],
    );
  }
}
