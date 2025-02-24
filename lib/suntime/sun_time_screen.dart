import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';

class SunTimeScreen extends StatefulWidget {
  const SunTimeScreen({super.key});

  @override
  State<SunTimeScreen> createState() => _SunTimeScreenState();
}

class _SunTimeScreenState extends State<SunTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'SunTime',link: '/'),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/locationicon.png'),
                SizedBox(width: 5,),
                Center(
                  child: Text(
                    'Hoài Đức, Hà Nội',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Image(
                        image: AssetImage('assets/images/suntimeimage/sunrise.png')
                    ),
                  ),
                  Text('Sun Rise', style: TextStyle(
                    color: Color(0xff12203A).withValues(alpha: 0.54),
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                  ),),
                  Text('05:13 AM ', style: TextStyle(
                      color: Color(0xff12203A),
                      fontWeight: FontWeight.w500,
                      fontSize: 17
                  ),)

                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Image(
                        image: AssetImage('assets/images/suntimeimage/sunset.png')
                    ),
                  ),
                  Text('Sun Set', style: TextStyle(
                      color: Color(0xff12203A).withValues(alpha: 0.54),
                      fontWeight: FontWeight.w500,
                      fontSize: 17
                  ),),
                  Text('06:30 PM ', style: TextStyle(
                      color: Color(0xff12203A),
                      fontWeight: FontWeight.w500,
                      fontSize: 17
                  ),)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
