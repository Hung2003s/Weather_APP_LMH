import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../widget/appbar_setting.dart';
import '../../../widget/circle_page.dart';


class UltravioletScreen extends StatefulWidget {
  const UltravioletScreen({super.key});

  @override
  State<UltravioletScreen> createState() => _UltravioletScreenState();
}

class _UltravioletScreenState extends State<UltravioletScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'UV Index', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state.loadingState == LoadingState.loading) {
              return Center(
                  child: CircularProgressIndicator());
            } else if (state.loadingState == LoadingState.error) {
              return Text('Error: ');
            } else if (state.loadingState == LoadingState.finished) {
              return Column(
                children: [
                  BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      print('---------------ok: ${state.weather.toString()}');
                      return CirclePage(
                        color1: Color(0xffF36253),
                        parameter: state.weather?.daily?.uvIndexMax.first.toString(),
                        color2: Color(0xffF9ED4B),
                        located:
                            '${state.locationName}',
                        textAirQuality:
                            '${(state.weather?.daily!.uvIndexMax.first)! < 3 ? 'Low'
                                : (state.weather?.daily!.uvIndexMax.first)! < 6 ? 'Moderate'
                                : (state.weather?.daily!.uvIndexMax.first)! < 8 ? 'Very High' : 'Extreme'}',
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
