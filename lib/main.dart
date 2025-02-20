import 'package:flutter/material.dart';
import 'package:weatherapp/view/homepage.dart';
import 'package:weatherapp/view/language_screen/language_screen.dart';
import 'package:weatherapp/view/theme_screen/theme_screen.dart';
import 'package:weatherapp/view/therometer_screen/thermometer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ThermometerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
