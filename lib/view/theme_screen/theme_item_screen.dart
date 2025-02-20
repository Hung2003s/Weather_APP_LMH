import 'package:flutter/material.dart';
import 'package:weatherapp/model/theme_item.dart';

class OneElementThemeScreen extends StatefulWidget {
  final ThemeItem themeItem;
  const OneElementThemeScreen({super.key, required this.themeItem});

  @override
  State<OneElementThemeScreen> createState() => _OneElementThemeScreenState();
}

class _OneElementThemeScreenState extends State<OneElementThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
            image: DecorationImage(
              image: AssetImage(widget.themeItem.image),
              fit: BoxFit.cover,
            )
        ),

        // child: ClipRect(
        //   child: Image(
        //       image: AssetImage('assets/images/themeimage/themepic1.jpg'),
        //       fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }
}
