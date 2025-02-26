import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';

class UltravioletScreen extends StatefulWidget {
  const UltravioletScreen({super.key});

  @override
  State<UltravioletScreen> createState() => _UltravioletScreenState();
}

class _UltravioletScreenState extends State<UltravioletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'UV Index', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: Column(
        children: [
          CirclePage(
            color1: Color(0xffF36253),
            parameter: 0.75,
            color2: Color(0xffF9ED4B),
            located: 'Hoài Đức, Hà Nội',
            textAirQuality: 'Low',
            textState: 'Good',
            unit: '',
            isUnit: false,
          )
        ],
      ),
    );
  }
}
