import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import 'package:geolocator/geolocator.dart';

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
    // context.read<AppBloc>().add(SetLocationandFetchDataEvent(
    //     latitude: context.watch<AppBloc>().state.latitude,
    //     longitude: context.watch<AppBloc>().state.latitude));
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
                        textAirQuality: 'low',
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

  String _getUVIndexCategory(double uvIndex) {
    if (uvIndex < 3) {
      return 'Low';
    } else if (uvIndex < 6) {
      return 'Moderate';
    } else if (uvIndex < 8) {
      return 'High';
    } else if (uvIndex < 11) {
      return 'Very High';
    } else {
      return 'Extreme';
    }
  }
}
