import 'package:flutter/material.dart';

class WeatherforecastItem extends StatelessWidget {
  final String day;
  final String weathercode;
  final String temp1;
  final String temp2;
  final String weatherState;

  const WeatherforecastItem({super.key, required this.day, required this.weathercode, required this.weatherState, required this.temp1, required this.temp2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0xff000000).withValues(alpha: 0.2),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4)
            )
          ]
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(day,style: TextStyle(
                color: Color(0xff12203A).withValues(alpha: 0.54),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
            ),

            Container(
              child:Row(
                children: [
                  Text('${temp1}°', style: TextStyle(
                      color: Color(0xff12203A),
                      fontWeight: FontWeight.w700,
                      fontSize: 14
                  ),),
                  SizedBox(width: 4,),
                  Text('$temp2°', style: TextStyle(
                      color: Color(0xff12203A).withValues(alpha: 0.54),
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),)
                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                    child: Image(
                        image: AssetImage(weathercode)
                    ),
                  ),
                  Text(weatherState,style: TextStyle(
                    color: Color(0xff12203A).withValues(alpha: 0.54),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),)
                ],
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}
