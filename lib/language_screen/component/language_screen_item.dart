import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/language_screen/language_bloc/language_bloc.dart';
import 'package:weatherapp/language_screen/model/language.dart';

class OneElementLanguageScreen extends StatelessWidget {
  final Language language;
  final int value;
  final int groupValue;
  final Function(int) onChange;

  const OneElementLanguageScreen({
    super.key,
    required this.language,
    required this.value,
    required this.onChange, required this.groupValue,
  });

  Widget build(BuildContext context) {

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return Container(
          height: (MediaQuery
              .of(context)
              .size
              .height - 180) / 10,
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
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      language.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff12203A)),
                    )
                  ],
                ),
              ),
              Radio(
                  value: value,
                  groupValue: groupValue,
                  onChanged: (value2) {
                    if (value2 != null) {
                      onChange(value2);
                    };
                    context.read<LanguageBloc>().add(SetAcronymEvent(languageAcronym: language.acronym));
                  }
              )
            ],
          ),
        );
      },
    );
  }
}
