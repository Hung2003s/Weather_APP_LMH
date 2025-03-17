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
  final WeatherRepository weatherRepository = WeatherRepository();
  late final Future<List<ChartData>> _hourlyWind;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hourlyWind = _loadWindChartData();
  }

  Future<List<ChartData>> _loadWindChartData() async {
    try {
      Weather? weather = await weatherRepository.getCurrentLocationAndFetchWeather();
      if (weather != null) {
        return await weatherRepository.processWeatherDataForChart(weather, 'windSpeed10M');
      } else {
        // Handle the case where weather data is not available
        return [];
      }
    } catch (e) {
      print("Error loading wind chart data: $e");
      return []; // Return an empty list or handle the error as needed
    }
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
      body: FutureBuilder<List<ChartData>>(
          future: _hourlyWind,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final windData = snapshot.data;
              if (windData!.isEmpty) {
                return const Center(child: Text('Không có dữ liệu gió'));
              }

              final latestWindSpeed = windData.isNotEmpty ? windData.last.yvalue : 0;
              final latestTime = windData.isNotEmpty ? windData.last.xvalue : '';
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    DiagramScreen(
                        textvalue: latestWindSpeed.toStringAsFixed(2),
                        located: 'Hoài Đức, Hà Nội',
                        time: latestTime,
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
