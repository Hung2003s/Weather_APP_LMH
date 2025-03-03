import 'package:flutter/material.dart';
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
  final OpenMeteoService _weatherService = OpenMeteoService();

  Future<Daily>? _daily;

  @override
  void initState() {
    super.initState();
    _getCurrentLocationAndFetchWeather();
  }

  Future<void> _getCurrentLocationAndFetchWeather() async {
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
          locationSettings: LocationSettings(accuracy: LocationAccuracy.best));

      setState(() {
        _daily = _weatherService.getDaily(
          latitude: position.latitude,
          longitude: position.longitude,
        );
      });
    } catch (e) {
      print("Error getting location or weather: $e");
      setState(() {
        _daily = _weatherService.getDaily(
          latitude: 21.0285,
          longitude: 105.8048,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'UV Index', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: Column(
        children: [
          FutureBuilder<Daily>(
              future: _daily,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final weather = snapshot.data;
                  return CirclePage(
                    color1: Color(0xffF36253),
                    parameter: weather?.uvIndexMax,
                    color2: Color(0xffF9ED4B),
                    located: 'Hoài Đức, Hà Nội',
                    textAirQuality: 'Low',
                    textState: 'Good',
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
