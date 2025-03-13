import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/app_bloc/app_bloc.dart';
import '../../../model/weather.dart';
import '../../../repository/weather_repository.dart';
import '../component/weather_item_2.dart';
import '../component/weatherforecast_item.dart';

class WeatherforecastScreen extends StatefulWidget {
  const WeatherforecastScreen({super.key});

  @override
  State<WeatherforecastScreen> createState() => _WeatherforecastScreenState();
}

class _WeatherforecastScreenState extends State<WeatherforecastScreen> {
  bool isCelcius = true;
  bool light = true;

  final WeatherRepository _weatherService = WeatherRepository();
  late Future<Weather?> _hourly;
  @override
  void initState() {
    super.initState();
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

      return _weatherService.fetchWether(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      print("Error getting location or weather: $e");
      return _hourly = _weatherService.fetchWether(
        latitude: 21.0285,
        longitude: 105.8048,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final PageController _pageController = PageController(viewportFraction: 0.2, initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather ForeCast',
          style: TextStyle(
            color: Color(0xff12203A),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: InkWell(
              onTap: () {
                GoRouter.of(context).go('/');
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              )),
        ),
        actions: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Container(
                height: 32,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    color: Color(0xffDBDBDB),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AppBloc>()
                            .add(ToggleTemperatureUnit());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                            color: state.tempunit == TemperatureUnit.celsius
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Text(
                            '°C',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: state.tempunit == TemperatureUnit.celsius
                                    ? Color(0xff8BC12D)
                                    : Color(0xff6D6D6D),
                                height: 0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AppBloc>()
                            .add(ToggleTemperatureUnit(

                        ));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                            color: state.tempunit == TemperatureUnit.celsius
                                ? Colors.transparent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Text(
                            '°F',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: state.tempunit == TemperatureUnit.celsius
                                    ? Color(0xff6D6D6D)
                                    : Color(0xff8BC12D),
                                height: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(child: SingleChildScrollView(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  FutureBuilder<Weather?>(
                    future: _hourly,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData && snapshot.data != null) {
                        final weather = snapshot.data;
                        print('-----------------------ok: ${weather}');
                        return Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/pixelmap.png'))),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/locationicon.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        'New York, USA',
                                        style: TextStyle(
                                          color: Color(0xff12203A),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFFD900).withValues(alpha: 0.1)),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/weather_forecast/sunshine.png'),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${state.tempunit == TemperatureUnit.celsius ? weather?.current?.temperature2M : ((weather?.current?.temperature2M)!*1.8 + 32).toStringAsFixed(2)}'
                                    '°'
                                    '${state.tempunit == TemperatureUnit.celsius
                                    ? 'C'
                                    : 'F'}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 64,
                                    color: Color(0xff12203A)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Feel like ${state.tempunit == TemperatureUnit.celsius ? weather?.current?.apparentTemperature : (weather?.current?.apparentTemperature)!*1.8 + 32}°${state.tempunit == TemperatureUnit.celsius ? 'C' : 'F'}',
                                style: TextStyle(
                                  color: Color(0xff12203A).withValues(alpha: 0.54),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return const Text('No data');
                      }
                    }
    ),
                  Container(
                    height: 90,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Center(
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child:
                                PageView.builder(
                                  controller: _pageController,
                                  itemCount: 5,
                                  pageSnapping: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: WeatherItem2(),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 30,
                          child: Image(
                            image: AssetImage(
                                'assets/images/weather_forecast/scroll.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Another 7 days',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return WeatherforecastItem(
                                  day: 'MON',
                                  weathercode: '',
                                  weatherState: 'SUN',);
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
