import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../util/language_data.dart';
import '../../../widget/appbar_setting.dart';
import 'language_screen_item.dart';


class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

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
                          language: listlanguage[index],
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
