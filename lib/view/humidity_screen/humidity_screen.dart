import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/bloc/app_bloc/app_bloc.dart';
import '../../widget/appbar_setting.dart';
import '../../widget/circle_page.dart';

class HumidityScreen extends StatelessWidget {
  const HumidityScreen({super.key});

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
                    parameter: '${state.weather!.current?.relativeHumidity2M}%',
                    color2: Color(0xff5363F3),
                    located: '${state.locationName}',
                    textAirQuality: '',
                    textState: '',
                    unit: '%',
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
