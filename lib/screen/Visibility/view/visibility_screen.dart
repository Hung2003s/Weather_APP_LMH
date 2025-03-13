import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/bloc/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';
import 'package:weatherapp/model/weather.dart';
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
  late Future<Weather?> _hourly;

  // @override
  // Future<void> didChangeDependencies() async {
  //   final controller = context.watch<AppBloc>().state;
  //   final latitude = context.watch<AppBloc>().state.latitude;
  //   final longitude = context.watch<AppBloc>().state.latitude;
  //   context
  //       .read<AppBloc>()
  //       .add(SetVisibilityParamEvent(latitude: latitude, longitude: longitude));
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    super.initState();
    _hourly = _getCurrentLocationAndFetchWeather();
  }

  Future<Weather?> _getCurrentLocationAndFetchWeather() async {
    bool serviceEnable;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

      return weatherRepository.fetchWether(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      print("Error getting location or weather: $e");
      return _hourly = weatherRepository.fetchWether(
        latitude: 21.0285,
        longitude: 105.8048,
      );
    }
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
                    FutureBuilder<Weather?>(
                        future: _hourly,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final weather = snapshot.data;
                            print(
                                '----------------ok ${weather?.current.toString()}');
                            return CirclePage(
                                color1: state.beginColor,
                                parameter: state.visibilityUnit ==
                                        VisibilityUnit.kilometer
                                    ? weather?.current?.temperature2M
                                    : ((weather?.current
                                                ?.temperature2M)! *
                                            0.62137199)
                                        .toStringAsFixed(2),
                                color2: state.endColor,
                                located: 'Hoài Đức, Hà Nội',
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
