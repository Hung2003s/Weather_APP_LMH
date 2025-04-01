import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/model/weather.dart';
import 'package:weatherapp/repository/weather_repository.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../util/service_data.dart';
import '../../../widget/custom_button.dart';
import 'home_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final WeatherRepository weatherRepository = WeatherRepository();
  bool isAlert = false;
  bool isConnected = false;


  void fetchData() async {
    Weather newWeather =
        await WeatherRepository().getCurrentLocationAndFetchWeather();
    context.read<AppBloc>().add(AddWeather(newWeather));
    context.read<AppBloc>().add(LoadDayTimeData());
    context.read<AppBloc>().add(LoadWeekTimeData());
    context.read<AppBloc>().add(SetLocationName());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppBloc>().add(SetLocationEvent());
      context.read<AppBloc>().add(FetchDataEvent());
    });
   
  }
  
  void showDialogBox() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Image.asset(''),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No internet connection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                textAlign: TextAlign.center,
                'Check your internet connection and try again.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppButton(
                    height: 46,
                    width: 140,
                    backgroundColor: Color(0xffFFFFFF),
                    textColor: Color(0xff000000),
                    text: 'Close',
                    onPressed: () {
                      Navigator.of(context).pop(); // Đóng dialog
                    },
                    textStyle: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomAppButton(
                    height: 46,
                    width: 140,
                    backgroundColor: Color(0xff28B2FF),
                    onPressed: () {
                      AppSettings.openAppSettings(
                        type: AppSettingsType.wifi,
                      );
                    },
                    child: const Text(
                      'Open Setting',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AppBloc,AppState>(
          builder: (context, state) {
            return  SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    state.checkPermission
                        ? Container()
                        : Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffBFC9D7).withValues(alpha: 0.2),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4))
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/homepageimage/warning.png')),
                              ),
                              Container(
                                height: 30,
                                child: Text(
                                  'Enable device location permission to update  temperature and \nweather condition',
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomAppButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                elevation: 0,
                                title: const Text('Allow location access'),
                                content: const Text(
                                  'Update temperature and weather conditions of your location by allowing access to your precise location',
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomAppButton(
                                        height: 46,
                                        width: 140,
                                        backgroundColor: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context, 'OK');
                                        },
                                        child: const Text(
                                          'Close',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      CustomAppButton(
                                        elevation: 0,
                                        height: 46,
                                        width: 140,
                                        backgroundColor: Colors.white,
                                        onPressed: () {
                                         context.read<AppBloc>().add(SetLocationEvent());
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Continue',
                                          style: TextStyle(
                                            color: Colors.lightBlueAccent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            width: 102,
                            backgroundColor: Color(0xff2196F3),
                            text: 'Allow',
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(0),
                          child: Column(
                            children: [
                              BlocBuilder<AppBloc, AppState>(
                                builder: (context, state) {
                                  return ClipRect(
                                    child: Transform.scale(
                                      scale: 2,
                                      alignment: Alignment.bottomCenter,
                                      child: Image(
                                        image: AssetImage(state.theme),
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width,
                                        height: 440,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 450),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withValues(alpha: 0.1),
                                      Color(0xffF4FAFA).withValues(alpha: 0.2),
                                    ])),
                          ),
                        ),
                        BlocBuilder<AppBloc, AppState>(
                          builder: (context, state) {
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 20, top: 10, right: 10, bottom: 10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Smart Thermometer',
                                              style: TextStyle(
                                                color: Color(0xff12203A),
                                                fontWeight: FontWeight.w800,
                                                fontSize: 20,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.place_outlined,
                                                  color: Color(0xff0A2958),
                                                  size: 14,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  '${state.locationName}',
                                                  style: TextStyle(
                                                      color: Color(0xff12203A),
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 14),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            GoRouter.of(context).go('/setting');
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(12.5),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.settings,
                                                color: Color(0xff0A2958),
                                                size: 15,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    height: 221,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.1),
                                                  spreadRadius: 0,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ) // vị trí đổ bóng: ngang và dọc
                                              ]),
                                          height: 221,
                                          padding: EdgeInsets.all(7),
                                          child: BlocBuilder<AppBloc, AppState>(
                                              builder: (context, state) {
                                                if (state.loadingState ==
                                                    LoadingState.loading) {
                                                  return Center(
                                                      child: CircularProgressIndicator());
                                                } else if (state.loadingState ==
                                                    LoadingState.error) {
                                                  return Text('Error: ');
                                                } else if (state.loadingState ==
                                                    LoadingState.finished) {
                                                  return Column(
                                                    children: [
                                                      Container(
                                                        height: 151,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    state.thermometer))),
                                                      ),
                                                      Text(
                                                        '${state.weather?.current?.temperature2M.toStringAsFixed(0)}°C/${((state.weather?.current?.temperature2M)! * 1.8 + 32).toStringAsFixed(0)} °F',
                                                        style: TextStyle(
                                                          color: Color(0xff0A2958),
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Feel like',
                                                        style: TextStyle(
                                                          color: Color(0xff0A2958BF)
                                                              .withValues(alpha: 0.75),
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${state.weather?.current?.temperature2M.toStringAsFixed(0)}°C/${((state.weather?.current?.temperature2M)! * 1.8 + 32).toStringAsFixed(0)}°F',
                                                        style: TextStyle(
                                                          color: Color(0xff0A2958BF)
                                                              .withValues(alpha: 0.75),
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                } else {
                                                  return const Text('No data');
                                                }
                                              }),
                                        ),
                                        Container(
                                          height: 72,
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.1),
                                                  spreadRadius: 0,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                ),
                                              ]),
                                          child: BlocBuilder<AppBloc, AppState>(
                                              builder: (context, state) {
                                                if (state.loadingState ==
                                                    LoadingState.loading) {
                                                  return Center(
                                                      child: CircularProgressIndicator());
                                                } else if (state.loadingState ==
                                                    LoadingState.error) {
                                                  return Text('Error: ');
                                                } else if (state.loadingState ==
                                                    LoadingState.finished) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/homepageimage/uvlogo.png'))),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    'UV Index',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff0A2958)
                                                                            .withValues(
                                                                            alpha:
                                                                            0.25),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        fontSize: 11),
                                                                  ),
                                                                  Text(
                                                                    '${state.weather!.daily?.uvIndexMax.first.toString()}',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff0A2958),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        fontSize: 16),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.symmetric(
                                                            vertical: 10),
                                                        width: 1,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xffCED9DC),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 15,
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/homepageimage/humiditylogo.png'))),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    'Humidity',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff0A2958)
                                                                            .withValues(
                                                                            alpha:
                                                                            0.25),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        fontSize: 11),
                                                                  ),
                                                                  Text(
                                                                    '${state.weather?.current?.relativeHumidity2M}%',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff0A2958),
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        fontSize: 16),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Text('No data');
                                                }
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    height: 300,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Colors.black.withValues(alpha: 0.2),
                                            spreadRadius: 0,
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                          ),
                                        ]),
                                    child: GridView.builder(
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        // mainAxisSpacing: 2,
                                        // crossAxisSpacing: 10,
                                        childAspectRatio: 1/1,
                                      ),
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemCount: listhomeitem.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                            GoRouter.of(context).push(listhomeitem[index].link);
                                          },
                                          child: OneeElementService(
                                              homeitem: listhomeitem[index]),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        if (!state.checkPermission)
                          Positioned.fill(
                              child: Container(
                                color: Colors.black54,
                                // Màu nền mờ để làm nổi bật thông báo
                                child: AlertDialog(
                                  title: Text('Yêu cầu Quyền Vị Trí'),
                                  content: Text(
                                      'Ứng dụng cần quyền vị trí để hiển thị dữ liệu thời tiết chính xác cho vị trí của bạn.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        context.read<AppBloc>().add(SetLocationEvent());
                                      },
                                      // Gọi hàm yêu cầu quyền khi bấm nút
                                      child: Text('Cho phép'),
                                    ),
                                  ],
                                ),
                              )),
                      ]),
                    ),
                  ],
                ),
              ),
            );
          })

    );
  }
}
