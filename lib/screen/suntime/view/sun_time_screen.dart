import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';

class SunTimeScreen extends StatefulWidget {
  const SunTimeScreen({super.key});

  @override
  State<SunTimeScreen> createState() => _SunTimeScreenState();
}

class _SunTimeScreenState extends State<SunTimeScreen> {

  String formatTime(String timeString) {
    try {
      DateTime dateTime = DateTime.parse(timeString);
      return DateFormat('HH:mm').format(dateTime);
    } catch (e) {
      print('Error parsing time: $e');
      return 'Invalid Time';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'SunTime', link: '/'),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.loadingState == LoadingState.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.loadingState == LoadingState.error) {
            return Text('Error: ');
          } else if (state.loadingState == LoadingState.finished) {
            return Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/locationicon.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: Text(
                          '${state.locationName}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                              image: AssetImage(
                                  'assets/images/suntimeimage/sunrise.png')),
                        ),
                        Text(
                          'Sun Rise',
                          style: TextStyle(
                              color: Color(0xff12203A).withValues(alpha: 0.54),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        Text(
                          '${formatTime(state.weather!.daily!.sunrise.first)} AM ',
                          style: TextStyle(
                              color: Color(0xff12203A),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                              image: AssetImage(
                                  'assets/images/suntimeimage/sunset.png')),
                        ),
                        Text(
                          'Sun Set',
                          style: TextStyle(
                              color: Color(0xff12203A).withValues(alpha: 0.54),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        Text(
                          '${formatTime(state.weather!.daily!.sunset.first)} PM ',
                          style: TextStyle(
                              color: Color(0xff12203A),
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  Container(height: 20,)
                ],
              ),
            );
          } else {
            return const Text('No data');
          }
        },
      ),
    );
  }
}
