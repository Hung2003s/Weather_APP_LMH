import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/Pollutants_screen/pollutants_screen.dart';
import 'package:weatherapp/Visibility/visibility_screen.dart';
import 'package:weatherapp/air_quality/air_quality_screen.dart';
import 'package:weatherapp/compass/compass_screen.dart';
import 'package:weatherapp/homepage/homepage.dart';
import 'package:weatherapp/humidity_screen/humidity_screen.dart';
import 'package:weatherapp/intro/intro_screen_1.dart';
import 'package:weatherapp/intro/intro_screen_2.dart';
import 'package:weatherapp/language_screen/language_screen.dart';
import 'package:weatherapp/pollen_screen/pollen_screen.dart';
import 'package:weatherapp/precipitation_screen/precipitation_screen.dart';
import 'package:weatherapp/setting_screen/setting_screen.dart';
import 'package:weatherapp/snow_fall_screen/snow_fall_screen.dart';
import 'package:weatherapp/suntime/sun_time_screen.dart';
import 'package:weatherapp/theme_screen/theme_screen.dart';
import 'package:weatherapp/therometer_screen/thermometer_screen.dart';
import 'package:weatherapp/uv_index/ultraviolet_screen.dart';
import 'package:weatherapp/weatherforecast_screen/weatherforecast_screen.dart';
import 'package:weatherapp/wind_screen/wind_screen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
final GoRouter _router = GoRouter(
  initialLocation: "/",
    routes: [
      GoRoute(path: "/", builder: ((context, state)=> const Homepage())),
      GoRoute(path: "/airquality", builder: ((context, state)=> const AirQualityScreen())),
      GoRoute(path: "/compass", builder: ((context, state)=> const CompassScreen())),
      GoRoute(path: "/humidity", builder: ((context, state)=> const HumidityScreen())),
      GoRoute(path: "/intro1", builder: ((context, state)=> const IntroScreen1())),
      GoRoute(path: "/intro2", builder: ((context, state)=> const IntroScreen2())),
      GoRoute(path: "/pollen", builder: ((context, state)=> const PollenScreen())),
      GoRoute(path: "/pollutants", builder: ((context, state)=> const PollutantsScreen())),
      GoRoute(path: "/precipitation", builder: ((context, state)=> const PrecipitationScreen())),
      GoRoute(path: "/setting", builder: ((context, state)=> const SettingScreen())),
      GoRoute(path: "/snowfall", builder: ((context, state)=> const SnowFallScreen())),
      GoRoute(path: "/thermometer", builder: ((context, state)=> const ThermometerScreen())),
      GoRoute(path: "/uvindex", builder: ((context, state)=> const UltravioletScreen())),
      GoRoute(path: "/visibility", builder: ((context, state)=> const VisibilityScreen())),
      GoRoute(path: "/weather", builder: ((context, state)=> const WeatherforecastScreen())),
      GoRoute(path: "/suntime", builder: ((context, state)=> const SunTimeScreen())),
      GoRoute(path: "/wind", builder: ((context, state)=> const WindScreen())),
      GoRoute(path: "/theme", builder: ((context, state)=> const ThemeScreen())),
      GoRoute(path: "/language", builder: ((context, state)=> const LanguageScreen())),
    ]
);
