import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math';
import 'package:weatherapp/components/appbar_setting.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({super.key});

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  double? direction;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        direction = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Compass', link: '/'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/locationicon.png'),
                  SizedBox(
                    width: 5,
                  ),
                  Center(
                    child: Text(
                      'Hoài Đức, Hà Nội',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Transform.rotate(
                      angle: (direction ?? 0) * (pi / 180) * -1,
                      child: Image.asset('assets/images/compass2.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 39, left: 3),
                    child: Center(
                        child: Image.asset('assets/images/compass1.png')),
                  ),
                ],
              ),
            ),
            Text(
              '${direction!.ceil()}',
              style: TextStyle(
                color: Color(0xff12203A),
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
