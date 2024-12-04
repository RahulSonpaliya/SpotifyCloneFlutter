import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static Future<XFile?> imageFromCamera() async {
    var imagePickerResponse = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    return imagePickerResponse;
  }

  static Future<XFile?> compressImage(XFile? image) async {
    if (image == null) return null;
    return await FlutterImageCompress.compressAndGetFile(
      image.path,
      image.path,
      minHeight: 1280,
      minWidth: 720,
      quality: 90,
    );
  }

  static Future<XFile?> imageFromGallery() async {
    var imagePickerResponse =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    return imagePickerResponse;
  }

  static Future<XFile?> showCameraOrGalleryChooser(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
              title: const Text('Pick from camera'),
              onTap: () async {
                var image = await imageFromCamera();
                Navigator.pop(context, image);
              },
            ),
            ListTile(
              title: const Text('Pick from gallery'),
              onTap: () async {
                var image = await imageFromGallery();
                Navigator.pop(context, image);
              },
            ),
          ],
        );
      },
    );
  }
}
