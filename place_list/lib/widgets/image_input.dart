// + Default Package.
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:io';

// + Image picker package.
import 'package:image_picker/image_picker.dart';

// + Path builder packages.
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as system_path;

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  final imagePicker = ImagePicker();

  // Image picker function.
  Future<void> _takePicture() async {
    final imageFile = await imagePicker.getImage(source: ImageSource.camera,maxWidth: 600);

    setState(() {

      _storedImage = File(imageFile.path);
    });

    final appDir = await system_path.getApplicationDocumentsDirectory();
    final fileName = path.basename(_storedImage.path);
    final savedIamge = await _storedImage.copy('${appDir.path}/${fileName}');

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('Image Not Selected..',textAlign: TextAlign.center,),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
              onPressed: _takePicture,
              icon: Icon(Icons.camera_alt),
              label: Text('Take A Picture.')),
        ),
      ],
    );
  }
}
