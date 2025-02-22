import 'package:flutter/material.dart';
import 'package:weatherapp/components/circle_page.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Thermometers',
          style: TextStyle(
            color: Color(0xff12203A),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              )),
        ),
      ),
      backgroundColor: Color(0xffF5F6FC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CirclePage(
              color1: Color(0xff5363F3),
              textParameter: '24.14 \nKm',
              color2: Color(0xff4BCFF9),
              located: 'Hoài Đức, Hà Nội',
              textAirQuality: '',
              textState: '')
        ],
      ),
    );
  }
}
