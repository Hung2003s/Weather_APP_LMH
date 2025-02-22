
import 'package:flutter/material.dart';
import 'package:weatherapp/model/language.dart';

import '../../model/setting_item.dart';

class OneElementLanguageScreen extends StatefulWidget {
  final Language language;
  const OneElementLanguageScreen({super.key, required this.language, });

  @override
  State<OneElementLanguageScreen> createState() => _OneElementLanguageScreenState();
}

class _OneElementLanguageScreenState extends State<OneElementLanguageScreen> {
late bool isChecked = false;
late int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 180)/10,
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.only(right: 10),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              widget.language.logo))),
                ),
                SizedBox(width: 16,),
                Text(widget.language.name, style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff12203A)
                ),)
              ],
            ),
          ),
          Radio(
              value: 0,
              groupValue: _value,
              onChanged:(value){
                setState(() {
                  _value = value!;
                });
              } )
        ],
      ),
    );
  }
}