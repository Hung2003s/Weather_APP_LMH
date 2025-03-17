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
  final WeatherRepository weatherRepository = WeatherRepository();
  late Future<List<ChartData>> _hourlyPrecipitation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hourlyPrecipitation = _loadWindChartData();
  }

  Future<List<ChartData>> _loadWindChartData() async {
    try {
      Weather? weather = await weatherRepository.getCurrentLocationAndFetchWeather();
      if (weather != null) {
        return await weatherRepository.processWeatherDataForChart(weather, 'precipitation');
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
      body: FutureBuilder<List<ChartData>>(
          future: _hourlyPrecipitation,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final precipitationData = snapshot.data;
              if (precipitationData!.isEmpty) {
                return const Center(child: Text('Không có dữ liệu gió'));
              }

              final latestPrecipitation = precipitationData.isNotEmpty ? precipitationData.last.yvalue : 0;
              final latestTime = precipitationData.isNotEmpty ? precipitationData.last.xvalue : '';
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    DiagramScreen(
                        textvalue: latestPrecipitation.toStringAsFixed(2),
                        located: 'Hoài Đức, Hà Nội',
                        time: latestTime,
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
