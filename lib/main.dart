import 'package:flutter/material.dart';
import 'package:flutter_ar_test_filters/ui/camera_screen.dart';
// import 'package:flutter_ar_test_filters/pages%20ui/camera_page.dart';
// import 'package:flutter_ar_test_filters/pages%20ui/test._camera.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CameraScreen(),
    );
  }
}
