import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/repository/weather_repository.dart';


class UltravioletScreen extends StatefulWidget {
  const UltravioletScreen({super.key});

  @override
  State<UltravioletScreen> createState() => _UltravioletScreenState();
}

class _UltravioletScreenState extends State<UltravioletScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();
  late Future<Weather?> _hourly;

  @override
  void initState() {
    super.initState();
    _hourly = weatherRepository.getCurrentLocationAndFetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'UV Index', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: FutureBuilder<Weather?>(
          future: _hourly,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final weather = snapshot.data;
              print('----------------ok ${weather?.current.toString()}');
              return Column(
                children: [
                  BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      print('---------------ok: ${state.weather.toString()}');
                      return CirclePage(
                        color1: Color(0xffF36253),
                        parameter: weather?.daily?.uvIndexMax.first.toString(),
                        color2: Color(0xffF9ED4B),
                        located:
                            'latitude: ${state.latitude}, longitude: ${state.longitude}',
                        textAirQuality:
                            '${(weather?.daily!.uvIndexMax.first)! < 3 ? 'Low'
                                : (weather?.daily!.uvIndexMax.first)! < 6 ? 'Moderate'
                                : (weather?.daily!.uvIndexMax.first)! < 8 ? 'Very High' : 'Extreme'}',
                        // _getUVIndexCategory(currentUVIndex),
                        textState: 'Good',
                        unit: '',
                        isUnit: false,
                      );
                    },
                  ),
                ],
              );
            } else {
              return const Text('No data');
            }
          }),
    );
  }
}
