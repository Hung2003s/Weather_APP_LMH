import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import '../component/visibility_switch.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  int value = 0;
  final WeatherRepository weatherRepository = WeatherRepository();
  //late Future<Weather?> _hourly;


  @override
  void initState() {
    super.initState();
    //_hourly = weatherRepository.getCurrentLocationAndFetchWeather();
  }

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
          Container(
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<AppBloc, AppState>(
                        builder: (context, state) {
                          if (state.loadingState == LoadingState.loading) {
                            return Center(
                                child: CircularProgressIndicator());
                          } else if (state.loadingState == LoadingState.error) {
                            return Text('Error: ');
                          } else if (state.loadingState == LoadingState.finished) {
                            return CirclePage(
                                color1: state.beginColor,
                                parameter: state.visibilityUnit ==
                                        VisibilityUnit.kilometer
                                    ? state.weather?.current?.temperature2M
                                    : ((state.weather?.current
                                                ?.temperature2M)! *
                                            0.62137199)
                                        .toStringAsFixed(2),
                                color2: state.endColor,
                                located: '${state.locationName}',
                                textAirQuality: '',
                                textState: '',
                                unit:
                                    '${state.visibilityUnit == VisibilityUnit.kilometer ? 'Km' : 'mi'}',
                                isUnit: true);
                          } else {
                            return const Text('No data');
                          }
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    VisibilitySwitch(
                        isKilometer:
                            state.visibilityUnit == VisibilityUnit.kilometer,
                        onUnitChange: (value) {
                          context.read<AppBloc>().add(SetVisibilityEvent(
                                beginColor: state.beginColor,
                                endColor: state.endColor,
                                buttonColor: state.buttonColor,
                                visibilitParameter: state.visibilityParameter,
                                visibilityUnit: value
                                    ? VisibilityUnit.kilometer
                                    : VisibilityUnit.miles,
                              ));
                        },
                        buttonColor: state.buttonColor),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
