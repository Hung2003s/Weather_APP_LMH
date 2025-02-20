import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/model/language.dart';
import 'package:weatherapp/view/language_screen/language_screen_item.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Language',
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.check_circle, color: Color(0xff0F2842),)
          )
        ],
      ),
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
