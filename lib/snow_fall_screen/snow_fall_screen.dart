import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/components/diagram_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model/chartdata.dart';

class SnowFallScreen extends StatefulWidget {
  const SnowFallScreen({super.key});

  @override
  State<SnowFallScreen> createState() => _SnowFallScreenState();
}

class _SnowFallScreenState extends State<SnowFallScreen> {
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
    LinearGradient(
        colors: color,
        begin: Alignment.topLeft,
        stops: stops);
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Snow',link: '/'),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DiagramScreen(
                textvalue: '4.5',
                located: 'New York, USA',
                time: '17:50',
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
                          ChartData('00h', 0, Colors.red),
                          ChartData('06h', 1.3, Colors.green),
                          ChartData('12h', 1.5, Colors.blue),
                          ChartData('18h', 2, Colors.pink),
                          ChartData('24h', 2.3, Colors.black)
                        ],
                        // Bind the color for all the data points from the data source
                        //pointColorMapper:(ChartData data, _) => data.color,
                        xValueMapper: (ChartData data, _) => data.month,
                        yValueMapper: (ChartData data, _) => data.value,
                        dashArray: [5, 2],
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          borderWidth: 1,
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
