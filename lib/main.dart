import 'package:flutter/material.dart';
import 'package:weatherapp/compass/compass_screen.dart';
import 'package:weatherapp/humidity_screen/humidity_screen.dart';
import 'package:weatherapp/precipitation_screen/precipitation_screen.dart';
import 'package:weatherapp/snow_fall_screen/snow_fall_screen.dart';
import 'package:weatherapp/wind_screen/wind_screen.dart';
import 'Visibility/visibility_screen.dart';

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
      home: HumidityScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
