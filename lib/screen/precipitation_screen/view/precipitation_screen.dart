import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/components/diagram_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion;
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather.dart';
import '../../../components/appbar_setting.dart';
import '../../../model/chartdata.dart';

class PrecipitationScreen extends StatefulWidget {
  const PrecipitationScreen({super.key});

  @override
  State<PrecipitationScreen> createState() => _PrecipitationScreenState();
}

class _PrecipitationScreenState extends State<PrecipitationScreen> {
  final WeatherRepository _weatherService = WeatherRepository();
  late final Future<Weather?> _hourlyPrecipitation;
  late List<ChartData> precipitationData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadChartData();
    _hourlyPrecipitation = _getCurrentLocationAndFetchWeather();
  }
  _loadChartData() async {
    precipitationData = await fetchDataFromApi(); // Gọi hàm giả định lấy dữ liệu API
    print('---------------precipitationData: $precipitationData');
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
      return _hourlyPrecipitation = _weatherService.fetchWether(
        latitude: 21.0285,
        longitude: 105.8048,
      );
    }
  }
  Future<List<ChartData>> fetchDataFromApi() async {
    final String url = "${baseUrl}?latitude=12.9333&longitude=100.8833&current=temperature_2m,relative_humidity_2m,precipitation,snowfall,weather_code&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,snowfall,weather_code,wind_speed_10m,temperature_1000hPa,relative_humidity_1000hPa,wind_speed_1000hPa&daily=weather_code,sunrise,sunset,uv_index_max,precipitation_sum,snowfall_sum&timezone=Asia%2FBangkok&past_hours=6&forecast_hours=1&cell_selection=nearest&models=best_match";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('---------------check ${response.body}');
      final Hourly hourly =
      Hourly.fromJson(jsonDecode(response.body)['hourly']);
      List<ChartData> dataPoints = [];
      // Iterate through timeList and temperatureList and create ChartData objects
      for (int i = 0; i < hourly.time.length; i++) {
        String formattedTime = convertTimeFormat(hourly.time[i]);
        dataPoints.add(ChartData(
          formattedTime,
          hourly.temperature2M[i].toDouble(),
        ));
      }
      return dataPoints;
    } else {
      print("Body: ${response.body}");
      throw Exception('Có lỗi trong quá trình lấy dữ liệu thời tiết');
    }

  }
  String convertTimeFormat(String inputTime) {
    // 1. Parse chuỗi thời gian đầu vào thành đối tượng DateTime
    DateTime dateTime = DateTime.parse(inputTime);

    // 2. Định dạng đối tượng DateTime thành chuỗi giờ:phút (HH:mm)
    String formattedTime = DateFormat("H'h'").format(dateTime);

    // 3. Trả về chuỗi thời gian đã định dạng
    return formattedTime;
  }
  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Color(0xff38EF7D).withValues(alpha: 0.3));
    color.add(Color(0xff38EF7D).withValues(alpha: 0.5));
    color.add(Color(0xff11998E).withValues(alpha: 0.4));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, begin: Alignment.topLeft, stops: stops);
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Precipitation', link: '/'),
      body: FutureBuilder<Weather?>(
          future: _hourlyPrecipitation,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final weather = snapshot.data;
              print('----------------ok ${weather.toString()}');
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    DiagramScreen(
                        textvalue: '${weather?.current?.precipitation}',
                        located: 'Hoài Đức, Hà Nội',
                        time: '17:50',
                        textunit: 'mm'),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Color(0xff000000).withValues(alpha: 0.1),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4))
                            ]),
                        child: syncfusion.SfCartesianChart(
                            primaryXAxis: syncfusion.CategoryAxis(
                              title: syncfusion.AxisTitle(text: 'times'),
                            ),
                            primaryYAxis: syncfusion.NumericAxis(
                              title: syncfusion.AxisTitle(text: 'Mm'),
                            ),
                            series: <syncfusion.CartesianSeries>[
                              syncfusion.SplineAreaSeries<ChartData, String>(
                                dataSource: precipitationData,
                                // [
                                //   // ChartData('${weather?.hourly?.time}', weather?.hourly?.precipitationProbability as double , Colors.red),
                                //   ChartData('06h', 1.3,),
                                //   ChartData('12h', 1.5,),
                                //   ChartData('18h', 2,),
                                //   ChartData('24h', 2.3, )
                                // ],
                                // Bind the color for all the data points from the data source
                                //pointColorMapper:(ChartData data, _) => data.color,
                                xValueMapper: (ChartData data, _) =>
                                    data.xvalue,
                                yValueMapper: (ChartData data, _) =>
                                    data.yvalue,
                                dashArray: [5, 2],
                                markerSettings: syncfusion.MarkerSettings(
                                  isVisible: true,
                                  shape: syncfusion.DataMarkerType.circle,
                                  borderWidth: 1,
                                  borderColor: Colors.red,
                                ),
                                dataLabelSettings: syncfusion.DataLabelSettings(
                                  isVisible: true,
                                  labelAlignment:
                                      syncfusion.ChartDataLabelAlignment.top,
                                ),
                                gradient: gradientColors,
                              )
                            ]))
                  ],
                ),
              );
            } else {
              return const Text('No data');
            }
          }),
    );
  }
}
