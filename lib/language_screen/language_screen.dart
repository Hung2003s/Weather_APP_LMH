import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/model/language.dart';

import 'language_screen_item.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<Language> _listlanguage = [
    Language('English', 'assets/images/languageimage/english.png' ),
    Language('French', 'assets/images/languageimage/french.png' ),
    Language('Germany', 'assets/images/languageimage/germany.png' ),
    Language('Italy', 'assets/images/languageimage/italy.png'),
    Language('Korea', 'assets/images/languageimage/korea.png' ),
    Language('Russia', 'assets/images/languageimage/russia.png' ),
    Language('Turkey', 'assets/images/languageimage/turkey.png' ),
    Language('India', 'assets/images/languageimage/india.png' ),
    Language('Japan', 'assets/images/languageimage/japan.png' ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Language',),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 180,
                  child: ListView.builder(
                      itemCount: _listlanguage.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OneElementLanguageScreen(language: _listlanguage[index],);
                      }),
                )
              ],
            ),
          )),
    );
  }
}
