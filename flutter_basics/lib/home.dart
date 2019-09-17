import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  getImageFIle(ImageSource source) async{
var image = await ImagePicker.pickImage(source: source);
 File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    var result = await FlutterImageCompress.compressAndGetFile(
        croppedFile.path, croppedFile.path,
        quality: 88,
      );
setState(() {
  _image = result;
  print(_image.lengthSync());
});
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text("Pick & Click & Crop image"),

      ),
      body: Center(  
        child: _image == null
        ? Text("Image") 
        : Image.file(_image,
        height: 250,
        width: 250,),
    
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        FloatingActionButton.extended(
          label: Text("Camera"),
          onPressed: () =>getImageFIle(ImageSource.camera),
          heroTag: UniqueKey(),
          icon: Icon(Icons.camera),
        ),
        SizedBox( 
          width: 20,
        ),
        FloatingActionButton.extended(
          label: Text("Gallery"),
          onPressed: () =>getImageFIle(ImageSource.gallery),
          heroTag: UniqueKey(),
          icon: Icon(Icons.photo_library),
        ),
      ],),
      
    );
  }
}