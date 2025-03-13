import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/circle_page.dart';

import '../../model/weather.dart';
import '../../repository/weather_repository.dart';

class AirQualityScreen extends StatefulWidget {
  const AirQualityScreen({super.key});

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  double textParameter = 30;
  WeatherRepository weatherRepository = WeatherRepository();
  late Future<Weather?> _current;

  @override
  void initState() {
    super.initState();
    _current = _getCurrentLocationAndFetchWeather();
  }

  Future<Weather?> _getCurrentLocationAndFetchWeather() async {
    bool serviceEnable;
    LocationPermission permission;

    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location services are disable');
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
      setState(() {
        _current = weatherRepository.fetchWether(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      });
    } catch (e) {
      print("Error getting location or weather: $e");
      setState(() {
        _current = weatherRepository.fetchWether(
          latitude: 21.0285,
          longitude: 105.8048,
        );
      });
    }
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
                  return CirclePage(
                    color1: color1,
                    parameter: weather?.current?.windSpeed10M,
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
