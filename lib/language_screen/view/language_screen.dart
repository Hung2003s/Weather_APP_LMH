import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/language_screen/controller/language_controller.dart';

import '../component/language_screen_item.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  LanguageController languageController = LanguageController();

  int groupValue = 1;
  void _radioValueChanged(int value2) {
    setState(() {
      groupValue = value2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Language',link: '/setting'),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 180,
                  child: ListView.builder(
                      itemCount: languageController.listlanguage.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OneElementLanguageScreen(
                          language: languageController.listlanguage[index],
                          value: index ,
                          onChange: _radioValueChanged,
                          groupValue: groupValue,);
                      }),
                )
              ],
            ),
          )),
    );
  }
}
