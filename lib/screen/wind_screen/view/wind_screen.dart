import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/diagram_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/chartdata.dart';


class WindScreen extends StatefulWidget {
  const WindScreen({super.key});

  @override
  State<WindScreen> createState() => _WindScreenState();
}

class _WindScreenState extends State<WindScreen> {
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
      appBar: AppbarSetting(titletext: 'Wind',link: '/'),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DiagramScreen(
                textvalue: '10.0',
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
                          color: Color(0xff000000).withValues(alpha: 0.1),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4))
                    ]),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: 'Month'),
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(text: 'Km/h'),
                    ),
                    series: <CartesianSeries>[
                      SplineAreaSeries<ChartData, String>(
                        dataSource: [
                          ChartData('Jan', 35, Colors.red),
                          ChartData('Feb', 28, Colors.green),
                          ChartData('Mar', 34, Colors.blue),
                          ChartData('Apr', 32, Colors.pink),
                          ChartData('May', 40, Colors.black)
                        ],
                        // Bind the color for all the data points from the data source
                        //pointColorMapper:(ChartData data, _) => data.color,
                        xValueMapper: (ChartData data, _) => data.xvalue,
                        yValueMapper: (ChartData data, _) => data.yvalue,
                        dashArray: [5, 2],
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          borderWidth: 2,
                          borderColor: Colors.red,
                        ),
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.top,
                        ),
                        gradient: gradientColors,
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
