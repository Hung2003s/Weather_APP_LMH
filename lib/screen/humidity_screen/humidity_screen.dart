import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';
import 'package:weatherapp/repository/weather_repository.dart';

import '../../bloc/app_bloc/app_bloc.dart';

class HumidityScreen extends StatefulWidget {
  const HumidityScreen({super.key});

  @override
  State<HumidityScreen> createState() => _HumidityScreenState();
}

class _HumidityScreenState extends State<HumidityScreen> {
  WeatherRepository weatherRepository = WeatherRepository();


  @override
  void initState() {
    super.initState();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Humidity', link: '/'),
      body: Column(
        children: [
          BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                if (state.loadingState == LoadingState.loading) {
                  return Center(
                      child: CircularProgressIndicator());
                } else if (state.loadingState == LoadingState.error) {
                  return Text('Error: ');
                } else if (state.loadingState == LoadingState.finished) {
                  // return Container();
                  return CirclePage(
                    color1: Color(0xff4BCFF9),
                    parameter: state.weather!.current?.relativeHumidity2M,
                    color2: Color(0xff5363F3),
                    located: 'Hoài Đức, Hà Nội',
                    textAirQuality: '',
                    textState: '',
                    unit: '%',
                    isUnit: true,
                  );
                } else {
                  return const Text('No data');
                }
              })
        ],
      ),
    );
  }
}
