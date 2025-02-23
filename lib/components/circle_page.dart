import 'package:flutter/cupertino.dart';

class CirclePage extends StatelessWidget {
  CirclePage({
    super.key,
    required this.color1,
    required this.textParameter,
    required this.color2,
    required this.located,
    required this.textAirQuality,
    required this.textState,
  });
  final String textAirQuality;
  final String located;
  final Color color1;
  final Color color2;
  final String textParameter;
  final String textState;
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
            SizedBox(width: 5,),
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
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 282,
              width: 282,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(9, 9),
                    color: Color(0xff000000).withValues(alpha: 0.1),
                    blurRadius: 16,
                  ),
                ],
                color: Color(0xffFFFFFF),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 242,
              width: 242,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [color2, color1],
                ),
              ),
              child: Center(
                child: Text(
                  textParameter,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 56,
                    color: Color(0xffFFFFFF),
                    height: 0.9
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        // classVisibility is VisibilityView
        //     ? Visibility_button()
        //     : Text(
        //   textState,
        //   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        // ),
      ],
    );
  }
}