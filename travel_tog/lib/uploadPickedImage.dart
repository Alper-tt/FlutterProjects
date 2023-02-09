import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_tog/signedConfig.dart';

class uploadPickedImage {
  final cloudinary = SignedConfig().cloudinary;

  File? _image;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? img = File(image.path);
    _image = img;
  }

  Future<String?> uploadPicked() async {
    await pickImage(ImageSource.camera);
    final response = await cloudinary.upload(
        file: _image?.path,
        fileBytes: _image?.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
        fileName: "some-name",
        progressCallback: (count, total) {
          print('Uploading image from file with progress: $count/$total');
        });
    if (response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
      return response.secureUrl;
    }
  }
}
