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
  double textParameter = 30;


  @override
  Widget build(BuildContext context) {

    Color color1;
    Color color2;
    String textAirQuality;
    String textState;

    if (textParameter > 0 && textParameter <= 50) {
      color1 = Color(0xff038603);
      color2 = Color(0xff0EE400);
      textAirQuality = 'Low';
      textState = 'Good';
    } else if (textParameter > 50 && textParameter <= 100) {
      color1 = Color(0xffB18B01);
      color2 = Color(0xffFFFF00);
      textAirQuality = 'Moderate';
      textState = 'Moderate';
    } else {
      color1 = Color(0xffB53600);
      color2 = Color(0xffFF7EFF);
      textAirQuality = 'High';
      textState = 'Unhealthy';
    }


    return Scaffold(
      appBar: AppbarSetting(titletext: 'Air Quality', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CirclePage(
              color1: color1,
              parameter: textParameter,
              color2: color2,
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
