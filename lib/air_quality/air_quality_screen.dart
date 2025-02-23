import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';

class AirQualityScreen extends StatefulWidget {
  const AirQualityScreen({super.key});

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Air Quality'),
      backgroundColor: Color(0xffF5F6FC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CirclePage(
              color1: Color(0xff038603),
              textParameter: '0.85',
              color2: Color(0xff00E400),
              located: 'Hoài Đức, Hà Nội',
              textAirQuality: 'Low',
              textState: 'Good')
        ],
      ),
    );
  }
}
