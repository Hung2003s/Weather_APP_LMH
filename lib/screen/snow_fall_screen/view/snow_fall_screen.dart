import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/diagram_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion;
import '../../../bloc/app_bloc/app_bloc.dart';
import '../../../model/chartdata.dart';
import '../../../repository/weather_repository.dart';

class SnowFallScreen extends StatefulWidget {
  const SnowFallScreen({super.key});

  @override
  State<SnowFallScreen> createState() => _SnowFallScreenState();
}

class _SnowFallScreenState extends State<SnowFallScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    context.read<AppBloc>().add(SetDataToChartEvent('snowfall'));
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
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        if (state.loadingState == LoadingState.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.loadingState == LoadingState.error) {
          return Text('Error: ');
        } else if (state.loadingState == LoadingState.finished) {
          if (state.chartData.isEmpty) {
            return const Center(child: Text('Không có dữ liệu gió'));
          }
          print('----check chartdata: ${state.chartData.length}');
          final latestSnowfall =
              state.chartData.isNotEmpty ? state.chartData.last.yvalue : 0;
          final latestTime =
              state.chartData.isNotEmpty ? state.chartData.last.xvalue : '';
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
                              color: Color(0xff000000).withValues(alpha: 0.1),
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
                            dataSource: state.chartData,
                            // Bind the color for all the data points from the data source
                            //pointColorMapper:(ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.xvalue,
                            yValueMapper: (ChartData data, _) => data.yvalue,
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
