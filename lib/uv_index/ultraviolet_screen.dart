import 'package:flutter/material.dart';
import 'package:weatherapp/components/circle_page.dart';

class UltravioletScreen extends StatefulWidget {
  const UltravioletScreen({super.key});

  @override
  State<UltravioletScreen> createState() => _UltravioletScreenState();
}

class _UltravioletScreenState extends State<UltravioletScreen> {
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
        children: [
          CirclePage(
              color1: Color(0xffF36253),
              textParameter: '0.85',
              color2: Color(0xffF9ED4B),
              located: 'Hoài Đức, Hà Nội',
              textAirQuality: 'Low',
              textState: 'Good')
        ],
      ),
    );
  }
}
