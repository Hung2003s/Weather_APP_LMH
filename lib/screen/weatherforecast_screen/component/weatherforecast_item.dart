import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherforecastItem extends StatelessWidget {
  const WeatherforecastItem({super.key});

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
              child: Text('MON',style: TextStyle(
                color: Color(0xff12203A).withValues(alpha: 0.54),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
            ),

            Container(
              child:Row(
                children: [
                  Text('25°', style: TextStyle(
                      color: Color(0xff12203A),
                      fontWeight: FontWeight.w700,
                      fontSize: 14
                  ),),
                  SizedBox(width: 4,),
                  Text('28°', style: TextStyle(
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
                    child: Image(
                        image: AssetImage('assets/images/rainicon.png')),
                  ),
                  Text('Rain',style: TextStyle(
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
