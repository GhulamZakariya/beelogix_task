import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'Ui/imageGallery/Controllers/photesGalleryController.dart';
import 'Ui/imageGallery/Ui/photoGalleryScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beelogix task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const PhotoGalleryScreen(),
    );
  }
}


PhotoesGalleryController photoesGalleryController = Get.put(PhotoesGalleryController());