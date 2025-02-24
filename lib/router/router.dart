import 'package:go_router/go_router.dart';

import '../Pollutants_screen/pollutants_screen.dart';
import '../Visibility/visibility_screen.dart';
import '../air_quality/air_quality_screen.dart';
import '../compass/compass_screen.dart';
import '../homepage/homepage.dart';
import '../humidity_screen/humidity_screen.dart';
import '../intro/intro_screen_1.dart';
import '../intro/intro_screen_2.dart';
import '../language_screen/language_screen.dart';
import '../pollen_screen/pollen_screen.dart';
import '../precipitation_screen/precipitation_screen.dart';
import '../setting_screen/setting_screen.dart';
import '../snow_fall_screen/snow_fall_screen.dart';
import '../suntime/sun_time_screen.dart';
import '../theme_screen/theme_screen.dart';
import '../therometer_screen/thermometer_screen.dart';
import '../uv_index/ultraviolet_screen.dart';
import '../weatherforecast_screen/weatherforecast_screen.dart';
import '../wind_screen/wind_screen.dart';

class RouterItem {
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
        GoRoute(path: "/thermometer", builder: ((context, state)=> const ThermometerScreen()),routes: [
          GoRoute(path: "/theme", builder: ((context, state)=> const ThemeScreen())),
          GoRoute(path: "/language", builder: ((context, state)=> const LanguageScreen())),
        ]),
        GoRoute(path: "/uvindex", builder: ((context, state)=> const UltravioletScreen())),
        GoRoute(path: "/visibility", builder: ((context, state)=> const VisibilityScreen())),
        GoRoute(path: "/weather", builder: ((context, state)=> const WeatherforecastScreen())),
        GoRoute(path: "/suntime", builder: ((context, state)=> const SunTimeScreen())),
        GoRoute(path: "/wind", builder: ((context, state)=> const WindScreen())),
      ]
  );
}