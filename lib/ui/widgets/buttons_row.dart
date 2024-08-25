import 'dart:io';

import 'package:deepar_flutter/deepar_flutter.dart';
import 'package:flutter/material.dart';

import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key, required this.deepArController});
  final DeepArController deepArController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: deepArController.flipCamera,
          icon: const Icon(
            Icons.flip_camera_ios_outlined,
            size: 34,
            color: Colors.white,
          ),
        ),
        FilledButton(
          onPressed: () async {
            try {
              // Take the screenshot
              File pickedImage = await deepArController.takeScreenshot();

              // Get the directory to save the file temporarily
              final directory = await getTemporaryDirectory();
              String path =
                  '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

              // Save the screenshot to the temporary directory
              File imageFile = await pickedImage.copy(path);

              // Save the image to the gallery
              await GallerySaver.saveImage(imageFile.path);

              print('Image saved to gallery!');
            } catch (e) {
              print('Error saving image: $e');
            }
          },
          child: const Icon(Icons.camera),
        ),
        IconButton(
          onPressed: deepArController.toggleFlash,
          icon: const Icon(
            Icons.flash_on,
            size: 34,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
