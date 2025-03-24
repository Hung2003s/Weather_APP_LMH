import 'package:flutter/material.dart';

class IntroItem extends StatelessWidget {
  final String image;
  final String icon;
  final String text1;
  final String text2;

  IntroItem({
    super.key,
    required this.image,
    required this.icon,
    required this.text1,
    required this.text2,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  child: Image.asset(
                    image,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: Image.asset(icon),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              text1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff12203A).withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}