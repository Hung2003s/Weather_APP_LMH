import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../bloc/app_bloc/app_bloc.dart';
import '../../../model/weather.dart';
import '../../../repository/weather_repository.dart';
import '../component/weather_item_2.dart';
import '../component/weatherforecast_item.dart';
import 'package:http/http.dart' as http;

class WeatherforecastScreen extends StatefulWidget {
  const WeatherforecastScreen({super.key});

  @override
  State<WeatherforecastScreen> createState() => _WeatherforecastScreenState();
}

class _WeatherforecastScreenState extends State<WeatherforecastScreen> {
  bool isCelcius = true;
  bool light = true;

  final WeatherRepository _weatherService = WeatherRepository();
  late Future<Weather?> _hourly;
  late List<String> daytime = [];

  @override
  void initState() {
    super.initState();
    _hourly = _weatherService.getCurrentLocationAndFetchWeather();
    _loadTimeData();
  }

  _loadTimeData() async {
    daytime = await fetchDataFromApi(); // Gọi hàm giả định lấy dữ liệu API
    print('---------------precipitationData: $daytime');
  }

  Future<List<String>> fetchDataFromApi() async {
    final String url =
        "${baseUrl}?latitude=12.9333&longitude=100.8833&current=temperature_2m,relative_humidity_2m,precipitation,snowfall,weather_code&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,snowfall,weather_code,wind_speed_10m,temperature_1000hPa,relative_humidity_1000hPa,wind_speed_1000hPa&daily=weather_code,sunrise,sunset,uv_index_max,precipitation_sum,snowfall_sum&timezone=Asia%2FBangkok&past_hours=6&forecast_hours=1&cell_selection=nearest&models=best_match";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('---------------check ${response.body}');
      final Hourly hourly =
          Hourly.fromJson(jsonDecode(response.body)['hourly']);
      List<String> dataPoints = [];
      // Iterate through timeList and temperatureList and create ChartData objects
      for (int i = 0; i < hourly.time.length; i++) {
        String formattedTime = convertTimeFormat(hourly.time[i]);
        dataPoints.add(
          formattedTime,
        );
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
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    // 3. Trả về chuỗi thời gian đã định dạng
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(viewportFraction: 0.2, initialPage: 0, keepPage: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather ForeCast',
          style: TextStyle(
            color: Color(0xff12203A),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: InkWell(
              onTap: () {
                GoRouter.of(context).go('/');
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              )),
        ),
        actions: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Container(
                height: 32,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    color: Color(0xffDBDBDB),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<AppBloc>().add(ToggleTemperatureUnit());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                            color: state.tempunit == TemperatureUnit.celsius
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Text(
                            '°C',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: state.tempunit == TemperatureUnit.celsius
                                    ? Color(0xff8BC12D)
                                    : Color(0xff6D6D6D),
                                height: 0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<AppBloc>().add(ToggleTemperatureUnit());
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        decoration: BoxDecoration(
                            color: state.tempunit == TemperatureUnit.celsius
                                ? Colors.transparent
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Text(
                            '°F',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: state.tempunit == TemperatureUnit.celsius
                                    ? Color(0xff6D6D6D)
                                    : Color(0xff8BC12D),
                                height: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(child: SingleChildScrollView(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  FutureBuilder<Weather?>(
                      future: _hourly,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData && snapshot.data != null) {
                          final weather = snapshot.data;
                          print('-----------------------ok: ${weather}');
                          return Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/pixelmap.png'))),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/locationicon.png'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          'New York, USA',
                                          style: TextStyle(
                                            color: Color(0xff12203A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFD900)
                                          .withValues(alpha: 0.1)),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/weather_forecast/sunshine.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${state.tempunit == TemperatureUnit.celsius ? weather?.current?.temperature2M : ((weather?.current?.temperature2M)! * 1.8 + 32).toStringAsFixed(2)}'
                                  '°'
                                  '${state.tempunit == TemperatureUnit.celsius ? 'C' : 'F'}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 64,
                                      color: Color(0xff12203A)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Feel like ${state.tempunit == TemperatureUnit.celsius ? weather?.current?.apparentTemperature : (weather?.current?.apparentTemperature)! * 1.8 + 32}°${state.tempunit == TemperatureUnit.celsius ? 'C' : 'F'}',
                                  style: TextStyle(
                                    color: Color(0xff12203A)
                                        .withValues(alpha: 0.54),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return const Text('No data');
                        }
                      }),
                  Container(
                    height: 90,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Center(
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: daytime.length,
                                  pageSnapping: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: WeatherItem2(
                                        weathercode: '',
                                        daytime: daytime[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 30,
                          child: Image(
                            image: AssetImage(
                                'assets/images/weather_forecast/scroll.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Another 7 days',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return WeatherforecastItem(
                                  day: 'MON',
                                  weathercode: '',
                                  weatherState: 'SUN',
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
