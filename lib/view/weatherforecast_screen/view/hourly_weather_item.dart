import 'package:flutter/cupertino.dart';

class HourlyWeatherItems extends StatelessWidget {
  final String weathercode;
  final String daytime;

  const HourlyWeatherItems(
      {super.key, required this.weathercode, required this.daytime});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            child: Image(
              image: AssetImage(weathercode),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Text(
              daytime,
              style: TextStyle(
                color: Color(0xff1C2025),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
