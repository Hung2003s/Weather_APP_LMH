import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  WeatherRepository weatherRepository = WeatherRepository();
    late Future<Weather?> _current;

  @override
  void initState() {
    super.initState();
     _current = weatherRepository.getCurrentLocationAndFetchWeather();
  }
    // Future<Weather?> _getCurrentLocationAndFetchWeather() async {
    //   bool serviceEnable;
    //   LocationPermission permission;
    //
    //   serviceEnable = await Geolocator.isLocationServiceEnabled();
    //   if (!serviceEnable) {
    //     return Future.error('Location services are disable');
    //   }
    //   permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission == LocationPermission.denied) {
    //       return Future.error('Location permissions are denied');
    //     }
    //   }
    //   if (permission == LocationPermission.deniedForever) {
    //     return Future.error(
    //         'Location permissions are permanently denied, we cannot request permissions.');
    //   }
    //   try {
    //     Position position = await Geolocator.getCurrentPosition(
    //         locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    //     setState(() {
    //       _current = weatherRepository.fetchWether(
    //         latitude: position.latitude,
    //         longitude: position.longitude,
    //       );
    //     });
    //   } catch (e) {
    //     print("Error getting location or weather: $e");
    //     setState(() {
    //       _current = weatherRepository.fetchWether(
    //         latitude: 21.0285,
    //         longitude: 105.8048,
    //       );
    //     });
    //   }
    // }


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
