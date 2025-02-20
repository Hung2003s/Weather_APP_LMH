
import 'package:flutter/material.dart';

import '../../model/setting_item.dart';

class OneElementSettingScreen extends StatefulWidget {
  final SettingItem settingItem;
  const OneElementSettingScreen({super.key, required this.settingItem});

  @override
  State<OneElementSettingScreen> createState() => _OneElementSettingScreenState();
}

class _OneElementSettingScreenState extends State<OneElementSettingScreen> {
  late bool isTemperature; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 180)/10,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff0005141A).withValues(alpha: 0.1),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ]
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            margin: EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.settingItem.imgae))),
                ),
                SizedBox(width: 16,),
                Text(widget.settingItem.title, style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff12203A)
                ),)
              ],
            ),
          ),

        ],
      ),
    );
  }
}