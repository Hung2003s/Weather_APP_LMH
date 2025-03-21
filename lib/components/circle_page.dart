import 'package:flutter/material.dart';

class CirclePage extends StatelessWidget {
  CirclePage({
    super.key,
    required this.color1,
    required this.parameter,
    required this.color2,
    required this.located,
    required this.textAirQuality,
    required this.textState,
    required this.unit,
    required this.isUnit,
  });

  final String textAirQuality;
  final String located;
  final Color color1;
  final Color color2;
  final dynamic parameter;
  final String textState;
  String unit;
  bool isUnit;

  // final dynamic classVisibility = VisibilityView();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/locationicon.png'),
            SizedBox(
              width: 5,
            ),
            Center(
              child: Text(
                located,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
          ],
        ),
        SizedBox(height: 31),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            textAirQuality,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 34),
        Container(
          height: 282,
          width: 282,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: Offset(9, 9),
                color: Color(0xff000000).withValues(alpha: 0.1),
                blurRadius: 16,
              ),
            ],

          ),
          child: Container(
            height: 242,
            width: 242,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [color2, color1],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${parameter}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 56,
                      color: Color(0xffFFFFFF),
                      height: 0.9),
                ),
                isUnit ? Text(
                  unit.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 56,
                      color: Color(0xffFFFFFF),
                      height: 0.9),
                ) : Container(),
              ],
            ),
          ),
        ),
        SizedBox(height: 32),
        // classVisibility is VisibilityView
        //     ? Visibility_button()
        //     :
        Text(
          textState,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ],
    );
  }
}
