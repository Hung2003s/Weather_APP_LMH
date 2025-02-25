import 'package:flutter/material.dart';
import 'package:weatherapp/therometer_screen/model/thermometer.dart';

class OneElementThermometerScreen extends StatefulWidget {
  final Thermometers thermometers;
  const OneElementThermometerScreen({super.key, required this.thermometers});
  @override
  State<OneElementThermometerScreen> createState() => _OneElementThermometerScreenState();
}

class _OneElementThermometerScreenState extends State<OneElementThermometerScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
        ),
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.thermometers.image))
          ),

          // child: ClipRect(
          //   child: Image(
          //       image: AssetImage('assets/images/themeimage/themepic1.jpg'),
          //       fit: BoxFit.cover,
          //   ),
          // ),
        ),
      ),
    );
  }
}
