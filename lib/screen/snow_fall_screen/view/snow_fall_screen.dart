import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/diagram_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion;
import '../../../model/chartdata.dart';
import '../../../model/weather.dart';
import '../../../repository/weather_repository.dart';
import 'package:http/http.dart' as http;

class SnowFallScreen extends StatefulWidget {
  const SnowFallScreen({super.key});

  @override
  State<SnowFallScreen> createState() => _SnowFallScreenState();
}

class _SnowFallScreenState extends State<SnowFallScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();
  late final Future<List<ChartData>> _hourlySnowFall;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _hourlySnowFall = _loadSnowFallChartData();
  }

  Future<List<ChartData>> _loadSnowFallChartData() async {
    try {
      Weather? weather =
          await weatherRepository.getCurrentLocationAndFetchWeather();
      if (weather != null) {
        return await weatherRepository.processWeatherDataForChart(
            weather, 'snowfall');
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
    color.add(Color(0xffF37335).withValues(alpha: 0.3));
    color.add(Color(0xffDC830).withValues(alpha: 0.5));
    color.add(Color(0xffFDC830).withValues(alpha: 0.4));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, begin: Alignment.topLeft, stops: stops);
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Snow', link: '/'),
      body: FutureBuilder<List<ChartData>>(
          future: _hourlySnowFall,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final snowfalldata = snapshot.data;
              if (snowfalldata!.isEmpty) {
                return const Center(child: Text('Không có dữ liệu tuyết rơi'));
              }

              final latestSnowfall =
                  snowfalldata.isNotEmpty ? snowfalldata.last.yvalue : 0;
              final latestTime =
                  snowfalldata.isNotEmpty ? snowfalldata.last.xvalue : '';
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    DiagramScreen(
                        textvalue: latestSnowfall.toStringAsFixed(2),
                        located: 'New York, USA',
                        time: latestTime,
                        textunit: 'cm'),
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
                                dataSource: snowfalldata,
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
