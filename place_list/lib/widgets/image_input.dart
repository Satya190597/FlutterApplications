// + Default Package.
import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

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
              onPressed: () {},
              icon: Icon(Icons.camera_alt),
              label: Text('Take A Picture.')),
        ),
      ],
    );
  }
}
