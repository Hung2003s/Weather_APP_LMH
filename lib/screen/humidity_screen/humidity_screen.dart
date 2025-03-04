import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/bloc/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/repository/weather_repository.dart';

class HumidityScreen extends StatefulWidget {
  const HumidityScreen({super.key});

  @override
  State<HumidityScreen> createState() => _HumidityScreenState();
}

class _HumidityScreenState extends State<HumidityScreen> {
  final WeatherRepository _weatherService = WeatherRepository();
    late Future<Weather?> _current;

  @override
  void initState() {
    super.initState();
     _current = _getCurrentLocationAndFetchWeather();
  }

  Future<Weather?> _getCurrentLocationAndFetchWeather() async {
    SetLocationEvent;
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
        return _weatherService.fetchWether(
          latitude: position.latitude,
          longitude: position.longitude,
        );

    } catch (e) {
      print("Error getting location or weather: $e");
      return _weatherService.fetchWether(
        latitude: 21.0285,
        longitude: 105.8048,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Humidity', link: '/'),
      body: Column(
        children: [
          FutureBuilder<Weather?>(
              future: _current,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final weather = snapshot.data;
                  print('----------------ok ${weather?.current.toString()}');
                  // return Container();
                  return CirclePage(
                    color1: Color(0xff4BCFF9),
                    parameter: weather!.current?.relativeHumidity2M,
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
