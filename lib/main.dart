import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/Pollutants_screen/view/pollutants_screen.dart';
import 'package:weatherapp/Visibility/view/visibility_screen.dart';
import 'package:weatherapp/air_quality/air_quality_screen.dart';
import 'package:weatherapp/compass/compass_screen.dart';
import 'package:weatherapp/homepage/view/homepage.dart';
import 'package:weatherapp/humidity_screen/humidity_screen.dart';
import 'package:weatherapp/intro/intro_screen_1.dart';
import 'package:weatherapp/intro/intro_screen_2.dart';
import 'package:weatherapp/language_screen/view/language_screen.dart';
import 'package:weatherapp/pollen_screen/view/pollen_screen.dart';
import 'package:weatherapp/precipitation_screen/view/precipitation_screen.dart';
import 'package:weatherapp/setting_screen/view/setting_screen.dart';
import 'package:weatherapp/snow_fall_screen/view/snow_fall_screen.dart';
import 'package:weatherapp/suntime/view/sun_time_screen.dart';
import 'package:weatherapp/theme_screen/view/theme_screen.dart';
import 'package:weatherapp/therometer_screen/view/thermometer_screen.dart';
import 'package:weatherapp/uv_index/view/ultraviolet_screen.dart';
import 'package:weatherapp/weatherforecast_screen/view/weatherforecast_screen.dart';
import 'package:weatherapp/wind_screen/view/wind_screen.dart';


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
      GoRoute(path: "/pollutant", builder: ((context, state)=> const PollutantsScreen())),
    ]
);
