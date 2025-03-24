import 'package:location/location.dart';
import '../router/router.dart';
import '../model/app_service.dart';

class HomeController {
  List<AppService> listhomeitem = [
    AppService('UV Index', 'assets/images/homepageimage/uvlogo.png', 0xffFFF8B5,
        AppRouter.uvIndexPath),
    AppService('Humidity', 'assets/images/homepageimage/humiditylogo.png',
        0xffD5EAFF, AppRouter.humidityPath),
    AppService('Air Quality', 'assets/images/homepageimage/airqualitylogo.png',
        0xffF9D5D3, AppRouter.airQualityPath),
    AppService(
        'Weather Forecast',
        'assets/images/homepageimage/weatherforecastlogo.png',
        0xffE9E3FA,
        AppRouter.weatherForecastPath),
    AppService('Visibility', 'assets/images/homepageimage/visibilitylogo.png',
        0xffC8F0DA, AppRouter.visibilityPath),
    AppService('Wind', 'assets/images/homepageimage/windlogo.png', 0xffFAE3E3,
        AppRouter.windPath),
    AppService('Snow Fall', 'assets/images/homepageimage/snowfalllogo.png',
        0xffE7E8EC, AppRouter.snowFallPath),
    AppService('Compass', 'assets/images/homepageimage/compasslogo.png',
        0xffF9F0E3, AppRouter.compassPath),
    AppService(
        'Precipitation',
        'assets/images/homepageimage/precipitationlogo.png',
        0xffD3F9F9,
        AppRouter.precipitationPath),
    AppService('Sun Time', 'assets/images/homepageimage/suntimelogo.png',
        0xffFAD4F8, AppRouter.sunTimePath),
    AppService('Pollen', 'assets/images/homepageimage/pollenlogo.png',
        0xffD4DAFA, AppRouter.pollenPath),
    AppService('Wave', 'assets/images/homepageimage/wavelogo.png', 0xffF9FFD8,
        AppRouter.wavePath),
  ];

  void determinePosition() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}
