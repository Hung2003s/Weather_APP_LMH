import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import '../../../bloc/app_bloc/app_bloc.dart';

import '../component/language_screen_item.dart';
import '../controller/language_controller.dart';

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
      appBar: AppbarSetting(titletext: 'Language', link: '/setting'),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 180,
                  child: ListView.builder(
                      itemCount: languageController.listlanguage.length,
                      itemBuilder: (BuildContext context, int index) {
                        //final acronym = LanguageController().listacronym[index].toString();
                        return OneElementLanguageScreen(
                          language: languageController.listlanguage[index],
                          value: index + 1,
                          onChange: _radioValueChanged,
                          groupValue: groupValue,
                        );
                      }),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
