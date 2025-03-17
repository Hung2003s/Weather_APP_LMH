import 'package:flutter/cupertino.dart';

class WeatherItem2 extends StatelessWidget {
  final String weathercode;
  final String daytime;
  const WeatherItem2({super.key, required this.weathercode, required this.daytime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image(
                image:AssetImage('assets/images/weather_forecast/scrollicon.png')),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text(daytime, style:
              TextStyle(
                color: Color(0xff1C2025),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
          )
        ],
      ),
    );
  }
}
