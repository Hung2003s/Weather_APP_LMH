import 'package:flutter/cupertino.dart';

class WeatherItem2 extends StatelessWidget {
  const WeatherItem2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Image(
                  image:AssetImage('assets/images/weather_forecast/iconscroll.png')),
            ),
            Text('03:00', style:
              TextStyle(
                color: Color(0xff1C2025),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),)
          ],
        ),
      ),
    );
  }
}
