import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class AddProfilePicture extends StatefulWidget {
  @override
  _AddProfilePictureState createState() => _AddProfilePictureState();
}

class _AddProfilePictureState extends State<AddProfilePicture> {

  File _pickedImage;

  Future<void> selectGallery() async{
    final file=await ImagePicker().getImage(
        source: ImageSource.gallery,maxWidth: 1024,maxHeight: 1024);
    if(file==null)
      return;
    final _imageTaken = File(file.path);
    final appDir=await syspaths.getApplicationDocumentsDirectory();
    final pathName=path.basename(_imageTaken.path);
    _pickedImage = await _imageTaken.copy("${appDir.path}/$pathName");
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
              child: _pickedImage == null? Icon(Icons.person,color: Colors.black,
                  size: SizeConfig.heightMultiplier * 12,):
                ClipRRect(
                  borderRadius:  BorderRadius.all(
                  Radius.circular(SizeConfig.heightMultiplier * 8)
                  ),
                    child: Image.file(_pickedImage,fit: BoxFit.cover,)),
            ),
            GestureDetector(
              onTap: () {
                selectGallery().then((value) {
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
          'Fatema',
          style: normalTextStyle.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: SizeConfig.textMultiplier * 3,
          ),
        )
      ],
    );
  }
}
