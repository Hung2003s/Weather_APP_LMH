import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';
import '../../bloc/app_bloc/app_bloc.dart';
import '../../repository/weather_repository.dart';

class AirQualityScreen extends StatefulWidget {
  const AirQualityScreen({super.key});

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  double textParameter = 30;
  WeatherRepository weatherRepository = WeatherRepository();

  // late Future<Weather?> _current;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color color1;
    Color color2;
    String textAirQuality;
    String textState;

    if (textParameter > 0 && textParameter <= 50) {
      color1 = Color(0xff038603);
      color2 = Color(0xff0EE400);
      textAirQuality = 'Low';
      textState = 'Good';
    } else if (textParameter > 50 && textParameter <= 100) {
      color1 = Color(0xffB18B01);
      color2 = Color(0xffFFFF00);
      textAirQuality = 'Moderate';
      textState = 'Moderate';
    } else {
      color1 = Color(0xffB53600);
      color2 = Color(0xffFF7EFF);
      textAirQuality = 'High';
      textState = 'Unhealthy';
    }

    return Scaffold(
      appBar: AppbarSetting(titletext: 'Air Quality', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<AppBloc, AppState>(builder: (context, state) {
            if (state.loadingState == LoadingState.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.loadingState == LoadingState.error) {
              return Text('Error: ');
            } else if (state.loadingState == LoadingState.finished) {
              return CirclePage(
                color1: color1,
                parameter: state.weather?.current?.windSpeed10M,
                color2: color2,
                located: 'Hoài Đức, Hà Nội',
                textAirQuality: textAirQuality,
                textState: textState,
                unit: '',
                isUnit: false,
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
