import 'dart:io';

import 'package:flutter/material.dart';

class ImageInputs extends StatefulWidget {
  const ImageInputs({Key? key}) : super(key: key);

  @override
  _ImageInputsState createState() => _ImageInputsState();
}

class _ImageInputsState extends State<ImageInputs> {
  File? _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [buildImage(), const SizedBox(width: 10), buildButton()],
    );
  }

  Expanded buildButton() {
    return Expanded(
        child: TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.camera),
      label: const Text('Take picture'),
    ));
  }

  Container buildImage() {
    return Container(
      child: _storedImage != null
          ? Image.file(
              _storedImage!,
              fit: BoxFit.fill,
            )
          : const Text('No image Taken',textAlign: TextAlign.center,),
      alignment: Alignment.center,
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
    );
  }
}
