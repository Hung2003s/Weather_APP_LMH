import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/visibility_bloc/visibility_unit_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';

import '../component/visibility_switch.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Visiblity', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/images/visibilityimage/map.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BlocBuilder<VisibilityUnitBloc, VisibilityState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CirclePage(
                      color1: state.beginColor,
                      parameter: 24.14,
                      color2: state.endColor,
                      located: 'Hoài Đức, Hà Nội',
                      textAirQuality: '',
                      textState: '',
                      unit:
                          '${state.unit == VisiblityUnit.kilometer ? 'Km' : 'Mi'}',
                      isUnit: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    VisibilitySwitch(
                        isKilometer: state.unit == VisiblityUnit.kilometer,
                        onUnitChange: (value) {
                          context
                              .read<VisibilityUnitBloc>()
                              .add(SetVisibilityEvent(
                                beginColor: state.beginColor,
                                endColor: state.endColor,
                                buttonColor: state.buttonColor,
                                visibilitParameter: state.visibilityParameter,
                                unit: value
                                    ? VisiblityUnit.miles
                                    : VisiblityUnit.kilometer,
                              ));
                        },
                        buttonColor: state.buttonColor),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
