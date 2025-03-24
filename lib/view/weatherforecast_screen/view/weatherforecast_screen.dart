import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import 'weather_item_2.dart';
import 'weatherforecast_item.dart';

class WeatherforecastScreen extends StatefulWidget {
  const WeatherforecastScreen({super.key});

  @override
  State<WeatherforecastScreen> createState() => _WeatherforecastScreenState();
}

class _WeatherforecastScreenState extends State<WeatherforecastScreen> {
  bool isCelcius = true;
  bool light = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
    PageController(viewportFraction: 0.2, initialPage: 0);
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
              print('----check list: ${state.dayTimeData}');
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
            if (state.loadingState == LoadingState.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.loadingState == LoadingState.error) {
              return Text('Error: ');
            } else if (state.loadingState == LoadingState.finished) {
              return Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 300,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/pixelmap.png'))),
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
                                    '${state.locationName}',
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
                            height: 105,
                            decoration: BoxDecoration(
                              // color: Color(0xffFFD900)
                              //     .withValues(alpha: 0.1)
                            ),
                            child: Image(
                              image: AssetImage(
                                'assets/images/weathercode/weather_${state
                                    .weather?.current?.weatherCode}.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${state.tempunit == TemperatureUnit.celsius ? state
                                .weather?.current?.temperature2M : ((state
                                .weather?.current?.temperature2M)! * 1.8 + 32)
                                .toStringAsFixed(2)}'
                                '°'
                                '${state.tempunit == TemperatureUnit.celsius
                                ? 'C'
                                : 'F'}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 64,
                                color: Color(0xff12203A)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Feel like ${state.tempunit ==
                                TemperatureUnit.celsius ? state.weather?.current
                                ?.apparentTemperature : ((state.weather?.current
                                ?.apparentTemperature)! * 1.8 + 32)
                                .toStringAsFixed(2)}°${state.tempunit ==
                                TemperatureUnit.celsius ? 'C' : 'F'}',
                            style: TextStyle(
                              color: Color(0xff12203A).withValues(alpha: 0.54),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Center(
                                child: Container(
                                  height: 60,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: PageView.builder(
                                    controller: _pageController,
                                    itemCount: state.dayTimeData.length,
                                    pageSnapping: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: WeatherItem2(
                                          weathercode:
                                          'assets/images/weathercode/weather_${state
                                              .weather?.hourly
                                              ?.weatherCode[index]}.png',
                                          daytime: state.dayTimeData[index],
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
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.weekTimeData.length,
                                itemBuilder: (context, index) {
                                  return WeatherforecastItem(
                                    day: '${state.weekTimeData[index]}',
                                    weathercode:
                                    'assets/images/weathercode/weather_${state
                                        .weather?.daily?.weatherCode[index]}.png',
                                    weatherState: 'SUN',
                                    temp1:
                                    '${state.tempunit == TemperatureUnit.celsius ?
                                    state.weather?.daily?.temperature2MMax[index]
                                        :  ((state.weather?.daily?.temperature2MMax[index])! * 1.8 + 32)
                                        .toStringAsFixed(2)
                                    }',
                                    temp2:
                                    '${state.tempunit == TemperatureUnit.celsius ?
                                    state.weather?.daily?.temperature2MMin[index]
                                        :  ((state.weather?.daily?.temperature2MMin[index])! * 1.8 + 32)
                                        .toStringAsFixed(2)}',
                                  );
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Text('No data');
            }
          },
        ),
      )),
    );
  }
}
