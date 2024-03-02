import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/first_screen.dart';

void main() {
  //  GeolocatorPlatform.instance; // Initialize the geolocator plugin

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Геолокація',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0CBA70),
      ),
      home: const FirstScreen(),
    );
  }
}
