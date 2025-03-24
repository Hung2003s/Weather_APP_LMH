import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion;
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../model/chartdata.dart';
import '../../../repository/weather_repository.dart';
import '../../../widget/appbar_setting.dart';
import '../../../widget/diagram_page.dart';

class WindScreen extends StatefulWidget {
  const WindScreen({super.key});

  @override
  State<WindScreen> createState() => _WindScreenState();
}

class _WindScreenState extends State<WindScreen> {
  final WeatherRepository weatherRepository = WeatherRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    context.read<AppBloc>().add(SetDataToChartEvent('windSpeed10M'));
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
          final latestWindSpeed =
              state.chartData.isNotEmpty ? state.chartData.last.yvalue : 0;
          final latestTime =
              state.chartData.isNotEmpty ? state.chartData.last.xvalue : '';
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                DiagramPage(
                    textvalue: latestWindSpeed.toStringAsFixed(2),
                    located: '${state.locationName}',
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
