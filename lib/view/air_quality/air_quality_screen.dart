import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/app_bloc/app_bloc.dart';
import '../../repository/weather_repository.dart';
import '../../widget/appbar_setting.dart';
import '../../widget/circle_page.dart';

class AirQualityScreen extends StatefulWidget {
  const AirQualityScreen({super.key});

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  double textParameter = 30;
  WeatherRepository weatherRepository = WeatherRepository();
  late  Color color1;
  late Color color2;
  late String textAirQuality;
  late String textState;
  // late Future<Weather?> _current;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                color1: (state.weather?.current?.windSpeed10M)! < 50 ? Color(0xff038603)
                : (state.weather?.current?.windSpeed10M)! < 100 ? Color(0xffB18B01) : Color(0xffB53600),

                parameter: state.weather?.current?.windSpeed10M,

                color2:  (state.weather?.current?.windSpeed10M)! < 50 ? Color(0xff0EE400)
                    : (state.weather?.current?.windSpeed10M)! < 100 ? Color(0xffFFFF00) : Color(0xffFF7EFF),

                located: '${state.locationName}',

                textAirQuality: '${((state.weather?.current?.windSpeed10M)! < 50) ? 'Low'
                    : ( state.weather?.current?.windSpeed10M)! < 100 ? 'Moderate'
                    :  'High'}',

                textState: '${((state.weather?.current?.windSpeed10M)! < 50) ? 'Good'
                    : ( state.weather?.current?.windSpeed10M)! < 100 ? 'Moderate'
                    :  'Unhealthy'}',

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
