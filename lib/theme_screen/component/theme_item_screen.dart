import 'package:flutter/material.dart';

class OneElementThemeScreen extends StatefulWidget {
  final String image;
  final bool choose;
  const OneElementThemeScreen({super.key, required this.image, required this.choose});

  @override
  State<OneElementThemeScreen> createState() => _OneElementThemeScreenState();
}

class _OneElementThemeScreenState extends State<OneElementThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: widget.choose ? Color(0xff8FA940) : Color(0xffFFFFFF),
        )
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
            image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
            )
        ),

      ),
    );
  }
}
