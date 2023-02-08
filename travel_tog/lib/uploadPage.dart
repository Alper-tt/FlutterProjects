import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class uploadPage extends StatefulWidget {
  const uploadPage({super.key});

  @override
  State<uploadPage> createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {
  @override
  Widget build(BuildContext context) {
    File? _image;

    Future pickImage(ImageSource source) async {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    }

    final cloudinary = Cloudinary.signedConfig(
        apiKey: "648494569393837",
        apiSecret: "Tsx0rRl1vkNLBlnaZKU0Yk9Fm1w",
        cloudName: "dtjfek0u2");

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: () async {
              await pickImage(ImageSource.camera);
              final response = await cloudinary.upload(
                  file: _image?.path,
                  fileBytes: _image?.readAsBytesSync(),
                  resourceType: CloudinaryResourceType.image,
                  fileName: "some-name",
                  progressCallback: (count, total) {
                    print(
                        'Uploading image from file with progress: $count/$total');
                  });
              if (response.isSuccessful) {
                print('Get your image from with ${response.secureUrl}');
              }
            })
          ],
        ),
      ),
    );
  }
}
