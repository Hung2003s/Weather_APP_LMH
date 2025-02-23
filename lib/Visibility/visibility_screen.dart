import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Visiblity'),
      backgroundColor: Color(0xffF5F6FC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CirclePage(
              color1: Color(0xff5363F3),
              textParameter: '24.14 \nKm',
              color2: Color(0xff4BCFF9),
              located: 'Hoài Đức, Hà Nội',
              textAirQuality: '',
              textState: '')
        ],
      ),
    );
  }
}
