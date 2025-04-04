import 'package:go_router/go_router.dart';

import '../view/Pollutants_screen/view/pollutants_screen.dart';
import '../view/Visibility/view/visibility_screen.dart';
import '../view/air_quality/air_quality_screen.dart';
import '../view/compass/compass_screen.dart';
import '../view/homepage/view/homepage.dart';
import '../view/humidity_screen/humidity_screen.dart';
import '../view/intro/screen/intro_screen.dart';
import '../view/language_screen/view/language_screen.dart';
import '../view/pollen_screen/view/pollen_screen.dart';
import '../view/precipitation_screen/view/precipitation_screen.dart';
import '../view/setting_screen/view/setting_screen.dart';
import '../view/snow_fall_screen/view/snow_fall_screen.dart';
import '../view/suntime/view/sun_time_screen.dart';
import '../view/theme_screen/view/theme_screen.dart';
import '../view/therometer_screen/view/thermometer_screen.dart';
import '../view/uv_index/view/ultraviolet_screen.dart';
import '../view/weatherforecast_screen/view/weatherforecast_screen.dart';
import '../view/wind_screen/view/wind_screen.dart';



class AppRouter {
  static String intro = "intro";
  static String introPath = "/intro";
  static String homeScreen = "/";

  // child class home
  static String settingName = "setting";
  static String settingPath = "/setting";

  static String uvIndexName = "uvindex";
  static String uvIndexPath = "/uvindex";

  static String humidityName = "humidity";
  static String humidityPath = "/humidity";

  static String airQualityName = "airQuality";
  static String airQualityPath = "/airquality";

  static String weatherForeCastName = "weatherForeCast";
  static String weatherForecastPath = "/weather";

  static String visibilityName = "visibility";
  static String visibilityPath = "/visibility";

  static String windName = "wind";
  static String windPath = "/wind";

  static String snowFallName = "snowFall";
  static String snowFallPath = "/snowfall";

  static String compassName = "compass";
  static String compassPath = "/compass";

  static String precipitationName = "precipitation";
  static String precipitationPath = "/precipitation";

  static String sunTimeName = "sunTime";
  static String sunTimePath = "/suntime";

  static String pollenName = "pollen";
  static String pollenPath = "/pollen";

  static String waveName = "wave";
  static String wavePath = "/wave";
  static String pollutantsName = "pollutant";
  static String pollutantsPath = "/pollutan";

  // child class setting
  static String themeName = "theme";
  static String themePath = "/theme";

  static String languageName = "Language";
  static String languagePath = "/language";

  static String thermometerName = "thermometer";
  static String thermometerPath = "/thermometer";

  static final GoRouter router = GoRouter(
      initialLocation: introPath,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        GoRoute(
            name: intro,
            path: introPath,
            builder: ((context, state) => const IntroScreen())),
        GoRoute(
            name: homeScreen,
            path: '/',
            builder: ((context, state) => const Homepage()),
            routes: [
              GoRoute(
                  name: settingName,
                  path: settingPath,
                  builder: ((context, state) => const SettingScreen()),
                  routes: []),
              GoRoute(
                  name: themeName,
                  path: themePath,
                  builder: ((context, state) => const ThemeScreen())),
              GoRoute(
                  name: languageName,
                  path: languagePath,
                  builder: ((context, state) => const LanguageScreen())),
              GoRoute(
                  name: thermometerName,
                  path: thermometerPath,
                  builder: ((context, state) => const ThermometerScreen()),
                  routes: []),
              GoRoute(
                  name: airQualityName,
                  path: airQualityPath,
                  builder: ((context, state) => const AirQualityScreen())),
              GoRoute(
                  name: compassName,
                  path: compassPath,
                  builder: ((context, state) => const CompassScreen())),
              GoRoute(
                  name: humidityName,
                  path: humidityPath,
                  builder: ((context, state) => const HumidityScreen())),
              GoRoute(
                  name: pollenName,
                  path: pollenPath,
                  builder: ((context, state) => const PollenScreen())),
              GoRoute(
                  name: pollutantsName,
                  path: pollutantsPath,
                  builder: ((context, state) => const PollutantsScreen())),
              GoRoute(
                  name: precipitationName,
                  path: precipitationPath,
                  builder: ((context, state) => const PrecipitationScreen())),
              GoRoute(
                  name: snowFallName,
                  path: snowFallPath,
                  builder: ((context, state) => const SnowFallScreen())),
              GoRoute(
                  name: uvIndexName,
                  path: uvIndexPath,
                  builder: ((context, state) => const UltravioletScreen())),
              GoRoute(
                  name: visibilityName,
                  path: visibilityPath,
                  builder: ((context, state) => const VisibilityScreen())),
              GoRoute(
                  name: weatherForeCastName,
                  path: weatherForecastPath,
                  builder: ((context, state) => const WeatherforecastScreen())),
              GoRoute(
                  name: sunTimeName,
                  path: sunTimePath,
                  builder: ((context, state) => const SunTimeScreen())),
              GoRoute(
                  name: windName,
                  path: windPath,
                  builder: ((context, state) => const WindScreen())),
              GoRoute(
                  name: wavePath,
                  path: waveName,
                  builder: ((context, state) => const PollutantsScreen())),
            ]),
      ]);
}
