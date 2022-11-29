import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/exception.model.dart';
import 'package:image_picker/image_picker.dart';

//Picking image
Future imagePicker() async {
  try {
    final XFile? inputImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (inputImage == null) return;

    //Proccessing image
    Uint8List imageBytes = await inputImage.readAsBytes();
    String encoded = base64Url.encode(imageBytes);
    Uint8List decoded = base64.decode(encoded);

    //All image info
    Map imageInfo = {
      "inputImage": inputImage,
      "imageBytes": imageBytes,
      "encoded": encoded,
      "decoded": decoded,
    };

    return imageInfo;
  } catch (e) {
    throw HttpException(e.toString());
  }
}
