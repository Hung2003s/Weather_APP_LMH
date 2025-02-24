import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';

class HumidityScreen extends StatefulWidget {
  const HumidityScreen({super.key});

  @override
  State<HumidityScreen> createState() => _HumidityScreenState();
}

class _HumidityScreenState extends State<HumidityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Humidity', link: '/'),
      body: Column(
        children: [
          CirclePage(
              color1: Color(0xff4BCFF9),
              textParameter: '100%',
              color2: Color(0xff5363F3),
              located: 'Hoài Đức, Hà Nội',
              textAirQuality: '',
              textState: '')
        ],
      ),
    );
  }
}
