import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryTest extends StatefulWidget {
  @override
  State<GalleryTest> createState() => _GalleryTestState();
}

class _GalleryTestState extends State<GalleryTest> {
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Multiple Image Picker Flutter"),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Column(children: [
                  ElevatedButton(
                    onPressed: () {
                      openImages();
                    },
                    child: Text("Open Gallery"),
                  ),
                  Divider(),
                  Text("Picked Files:"),
                  Divider(),
                  imagefiles != null
                      ? Wrap(
                          children: imagefiles!.map((imageone) {
                            return Container(
                                child: Card(
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Image.file(File(imageone.path)),
                              ),
                            ));
                          }).toList(),
                        )
                      : Container(),
                ]),
              )),
              ElevatedButton(
                onPressed: () {
                  print("success");
                },
                child: Text("success"),
              ),
            ],
          ),
        ));
  }
}
