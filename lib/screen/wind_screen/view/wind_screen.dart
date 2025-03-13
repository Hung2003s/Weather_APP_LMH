import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/diagram_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion;
import '../../../model/chartdata.dart';
import '../../../model/weather.dart';
import '../../../repository/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class WindScreen extends StatefulWidget {
  const WindScreen({super.key});

  @override
  State<WindScreen> createState() => _WindScreenState();
}

class _WindScreenState extends State<WindScreen> {
  final WeatherRepository _weatherService = WeatherRepository();
  late final Future<Weather?> _hourlyWind;
  late List<ChartData> windData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadChartData();
    _hourlyWind = _getCurrentLocationAndFetchWeather();
  }

  _loadChartData() async {
    windData = await fetchDataFromApi(); // Gọi hàm giả định lấy dữ liệu API
    print('---------------Windata: $windData');
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
      return _hourlyWind = _weatherService.fetchWether(
        latitude: 21.0285,
        longitude: 105.8048,
      );
    }
  }

  Future<List<ChartData>> fetchDataFromApi() async {
    final String url =
        "${baseUrl}?latitude=21.05&longitude=105.7833&daily=weather_code,sunset,uv_index_max,rain_sum,precipitation_hours,sunrise,snowfall_sum,precipitation_sum,temperature_2m_max,precipitation_probability_max&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation_probability,rain,snowfall,weather_code,visibility,wind_speed_10m,temperature_80m,uv_index,temperature_1000hPa,relative_humidity_1000hPa&models=best_match&current=temperature_2m,wind_speed_10m,relative_humidity_2m,snowfall,precipitation,apparent_temperature,weather_code,wind_direction_10m,rain&forecast_hours=6&past_hours=6";
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
          hourly.windSpeed10M[i].toDouble(),
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
    color.add(Colors.blue[50]!);
    color.add(Colors.blue[200]!);
    color.add(Colors.blue);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Wind', link: '/'),
      body: FutureBuilder<Weather?>(
          future: _hourlyWind,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final weather = snapshot.data;
              print('----------------ok ${weather?.hourly.toString()}');
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    DiagramScreen(
                        textvalue: '10',
                        located: 'Hoài Đức, Hà Nội',
                        time: '17:50',
                        textunit: 'Km/h'),
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
                              title: syncfusion.AxisTitle(text: 'Month'),
                            ),
                            primaryYAxis: syncfusion.NumericAxis(
                              title: syncfusion.AxisTitle(text: 'Km/h'),
                            ),
                            series: <syncfusion.CartesianSeries>[
                              syncfusion.SplineAreaSeries<ChartData, String>(
                                dataSource: windData
                                // [
                                //   ChartData('Jan', 35,),
                                //   ChartData('Feb', 28, ),
                                //   ChartData('Mar', 34, ),
                                //   ChartData('Apr', 32, ),
                                //   ChartData('May', 40, )
                                // ]
                                ,
                                // Bind the color for all the data points from the data source
                                //pointColorMapper:(ChartData data, _) => data.color,
                                xValueMapper: (ChartData data, _) =>
                                    data.xvalue,
                                yValueMapper: (ChartData data, _) =>
                                    data.yvalue,
                                dashArray: [5, 2],
                                markerSettings: syncfusion.MarkerSettings(
                                  isVisible: false,
                                  shape: syncfusion.DataMarkerType.circle,
                                  borderWidth: 2,
                                  borderColor: Colors.red,
                                ),
                                color: Color(0xff118BDA),
                                dataLabelSettings: syncfusion.DataLabelSettings(
                                  isVisible: false,
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
