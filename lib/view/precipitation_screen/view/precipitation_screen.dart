import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion;
import 'package:weatherapp/repository/weather_repository.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../model/chartdata.dart';
import '../../../widget/appbar_setting.dart';
import '../../../widget/diagram_page.dart';

class PrecipitationScreen extends StatefulWidget {
  const PrecipitationScreen({super.key});

  @override
  State<PrecipitationScreen> createState() => _PrecipitationScreenState();
}

class _PrecipitationScreenState extends State<PrecipitationScreen> {
  final List<Color> color = <Color>[];
  final List<double> stops = <double>[];
  late LinearGradient gradientColors;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AppBloc>().add(SetDataToChartEvent('precipitation'));
    color.add(Color(0xff38EF7D).withValues(alpha: 0.3));
    color.add(Color(0xff38EF7D).withValues(alpha: 0.5));
    color.add(Color(0xff11998E).withValues(alpha: 0.4));

    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    gradientColors =
        LinearGradient(colors: color, begin: Alignment.topLeft, stops: stops);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Precipitation', link: '/'),
      body: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
        if (state.loadingState == LoadingState.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.loadingState == LoadingState.error) {
          return Text('Error: ');
        } else if (state.loadingState == LoadingState.finished) {
          if (state.chartData.isEmpty) {
            return const Center(child: Text('Không có dữ liệu '));
          }
          print('----check chartdata: ${state.chartData.length}');
          final latestPrecipitation =
              state.chartData.isNotEmpty ? state.chartData.last.yValue : 0;
          final latestTime =
              state.chartData.isNotEmpty ? state.chartData.last.xValue : '';
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                DiagramPage(
                    textvalue: latestPrecipitation.toStringAsFixed(2),
                    located: '${state.locationName}',
                    time: latestTime,
                    textunit: 'mm'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3),
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
                          title: syncfusion.AxisTitle(text: 'times'),
                        ),
                        primaryYAxis: syncfusion.NumericAxis(
                          title: syncfusion.AxisTitle(text: 'Mm'),
                        //  maximum: state.chartData.isNotEmpty ? (state.chartData.map((data) => data.yValue as num).reduce((a, b) => a > b ? a : b) * 1.3) : 1.0,
                        ),
                        series: <syncfusion.CartesianSeries>[
                          syncfusion.SplineAreaSeries<ChartData, String>(
                            dataSource: state.chartData,

                            // Bind the color for all the data points from the data source
                            // pointColorMapper:(ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.xValue,
                            yValueMapper: (ChartData data, _) => data.yValue,
                            dashArray: [5, 2],
                            markerSettings: syncfusion.MarkerSettings(
                              isVisible: true,
                              shape: syncfusion.DataMarkerType.circle,
                              borderWidth: 1,
                              borderColor: Colors.blue,
                            ),
                            dataLabelSettings: syncfusion.DataLabelSettings(
                              isVisible: true,
                              labelAlignment:
                                  syncfusion.ChartDataLabelAlignment.auto,
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
