
import 'package:flutter/material.dart';
import 'package:weatherapp/Visibility/component/visibility_switch.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Visiblity', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/images/visibilityimage/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CirclePage(
                  color1: Color(0xff5363F3),
                  parameter: 24.14,
                  color2: Color(0xff4BCFF9),
                  located: 'Hoài Đức, Hà Nội',
                  textAirQuality: '',
                  textState: '',
                  unit: 'Km',
                  isUnit: true,
                ),
                SizedBox(
                  height: 30,
                ),
                VisibilitySwitch(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
