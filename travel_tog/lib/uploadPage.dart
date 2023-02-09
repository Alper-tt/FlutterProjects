import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:travel_tog/uploadPickedImage.dart';

class uploadPage extends StatelessWidget {
  const uploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: () async {
              String? url = await uploadPickedImage().uploadPicked();
            })
          ],
        ),
      ),
    );
  }
}
