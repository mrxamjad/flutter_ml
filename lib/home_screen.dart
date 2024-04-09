import 'package:flutter/material.dart';
import 'package:flutter_image_picker_tutorial/module/image_picker/image_picker_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen 1
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ImagePickerScreen(
                              title: 'Image Picker',
                            )));
              },
              child: const Text('Image Picker'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen 2
              },
              child: Text('Screen 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Screen 3
              },
              child: Text('Screen 3'),
            ),
          ],
        ),
      ),
    );
  }
}
