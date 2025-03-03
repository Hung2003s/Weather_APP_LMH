import 'package:flutter/material.dart';

class OneElementThermometerScreen extends StatefulWidget {
  final String image;
  final bool choose;
  const OneElementThermometerScreen({super.key, required this.image, required this.choose});
  @override
  State<OneElementThermometerScreen> createState() => _OneElementThermometerScreenState();
}

class _OneElementThermometerScreenState extends State<OneElementThermometerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: widget.choose ? Border.all(color: Color(0xff8FA940,), width: 1) : Border(),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.image))
          ),
        ),
      ),
    );
  }
}
