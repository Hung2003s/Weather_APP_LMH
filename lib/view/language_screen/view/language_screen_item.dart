import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../model/language.dart';

class OneElementLanguageScreen extends StatelessWidget {
  final Language language;
  final AppLanguage value;
  final AppLanguage groupValue;
  final int current_index;


  const OneElementLanguageScreen(
      {super.key,
      required this.language,
      required this.value,
      required this.groupValue,
      required this.current_index});

  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          height: (MediaQuery.of(context).size.height - 180) / 10,
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
              ]),
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
                              image: AssetImage(language.logo))),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      language.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff12203A),
                      ),
                    )
                  ],
                ),
              ),
              Radio(
                  value: value,
                  groupValue: groupValue,
                  onChanged: (AppLanguage? value2) {
                    if (value2 != null) {
                      context.read<AppBloc>().add(
                          SetAcronymEvent(languageAcronym: language.acronym));
                      context
                          .read<AppBloc>()
                          .add(ChangeLanguageIndex(currentLanguage: value));
                    }
                  })
            ],
          ),
        );
      },
    );
  }
}
