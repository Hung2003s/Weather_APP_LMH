import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/language_bloc/language_bloc.dart';
import '../../../bloc/setting_bloc/settting_bloc.dart';
import '../../../bloc/setting_bloc/setting_event.dart';
import '../../../bloc/setting_bloc/setting_state.dart';
import '../model/setting_item.dart';

class OneElementSettingScreen extends StatefulWidget {
  final SettingItem settingItem;

  const OneElementSettingScreen({super.key, required this.settingItem});

  @override
  State<OneElementSettingScreen> createState() =>
      _OneElementSettingScreenState();
}

class _OneElementSettingScreenState extends State<OneElementSettingScreen> {
  late bool isTemperature;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemperatureUnitBloc, TemperatureUnitState>(
      builder: (context, state) {
        return Container(
          height: (MediaQuery.of(context).size.height - 180) / 10,
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
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // GoRouter.of(context).go(widget.settingItem.linksetting);
                },
                child: Container(
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
                                image: AssetImage(widget.settingItem.image))),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        widget.settingItem.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff12203A)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: widget.settingItem.istemper
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<TemperatureUnitBloc>()
                                      .add(ToggleTemperatureUnit());
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: state.unit == TemperatureUnit.celsius
                                        ? Color(0xff0A2958)
                                        : Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff000514)
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          offset: Offset(2, 2))
                                    ]),
                                child: Center(
                                  child: Text(
                                    '°C',
                                    style: TextStyle(
                                        color: state.unit ==
                                                TemperatureUnit.celsius
                                            ? Color(0xffFFFFFF)
                                            : Color(0xff0A2958),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<TemperatureUnitBloc>()
                                      .add(ToggleTemperatureUnit());
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: state.unit == TemperatureUnit.celsius
                                        ? Color(0xffFFFFFF)
                                        : Color(0xff0A2958),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff000514)
                                              .withValues(alpha: 0.1),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          offset: Offset(0, 2))
                                    ]),
                                child: Center(
                                  child: Text(
                                    '°F',
                                    style: TextStyle(
                                        color: state.unit ==
                                                TemperatureUnit.celsius
                                            ? Color(0xff0A2958)
                                            : Color(0xffFFFFFF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : BlocBuilder<LanguageBloc, LanguageState>(
                        builder: (context, state) {
                          return Container(
                            child: widget.settingItem.acronym
                                ? Container(
                                    child: Text(
                                      state.acronym,
                                      style: TextStyle(
                                          color: Color(0xff0A2958),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  )
                                : Container(),
                          );
                        },
                      ),
              ),
              SizedBox()
            ],
          ),
        );
      },
    );
  }
}
