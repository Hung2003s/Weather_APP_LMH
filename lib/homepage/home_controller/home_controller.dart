import '../model/app_service.dart';

class HomeController{

   List<AppService> listhomeitem = [
    AppService('UV Index', 'assets/images/homepageimage/uvlogo.png', 0xffFFF8B5,'/uvindex'),
    AppService('Humidity', 'assets/images/homepageimage/humiditylogo.png',0xffD5EAFF, '/humidity'),
    AppService('Air Quality', 'assets/images/homepageimage/airqualitylogo.png',0xffF9D5D3,'/airquality'),
    AppService('Weather Forecast', 'assets/images/homepageimage/weatherforecastlogo.png', 0xffE9E3FA,'/weather'),
    AppService('Visibility', 'assets/images/homepageimage/visibilitylogo.png',0xffC8F0DA,'/visibility' ),
    AppService('Wind', 'assets/images/homepageimage/windlogo.png',0xffFAE3E3 ,'/wind'),
    AppService('Snow Fall', 'assets/images/homepageimage/snowfalllogo.png', 0xffE7E8EC,'/snowfall'),
    AppService('Compass', 'assets/images/homepageimage/compasslogo.png', 0xffF9F0E3,'/compass'),
    AppService('Precipitation', 'assets/images/homepageimage/precipitationlogo.png',0xffD3F9F9 ,'/precipitation'),
    AppService('Sun Time', 'assets/images/homepageimage/suntimelogo.png',0xffFAD4F8,'/suntime' ),
    AppService('Pollen', 'assets/images/homepageimage/pollenlogo.png', 0xffD4DAFA,'/pollen'),
    AppService('Wave', 'assets/images/homepageimage/wavelogo.png',0xffF9FFD8 ,'/pollutant'),
  ];
}