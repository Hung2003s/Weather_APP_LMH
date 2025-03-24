import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../widget/appbar_setting.dart';
import 'language_screen_item.dart';
import '../../../controller/language_controller.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  LanguageController languageController = LanguageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                Expanded(
                  child: ListView.builder(
                      itemCount: AppLanguage.values.length,
                      itemBuilder: (BuildContext context, int index) {
                        //final acronym = LanguageController().listacronym[index].toString();
                        final AppLanguage language = AppLanguage.values[index];
                        return OneElementLanguageScreen(
                          language: languageController.listlanguage[index],
                          value: language,
                          groupValue: state.selectedLanguage,
                          current_index: index + 1,
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
