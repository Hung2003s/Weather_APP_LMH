import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/app_bloc/app_bloc.dart';
import '../component/home_item.dart';
import '../home_controller/home_controller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
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
                  gradient:
                      LinearGradient(begin: Alignment.bottomCenter, colors: [
                Colors.white.withValues(alpha: 0.1),
                Color(0xffF4FAFA).withValues(alpha: 0.2),
              ])),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                Container(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.place_outlined,
                                color: Color(0xff0A2958),
                                size: 14,
                              ),
                              Text(
                                'Hoài Đức, Hà Nội',
                                style: TextStyle(
                                    color: Color(0xff12203A),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: InkWell(
                            onTap: () {
                              GoRouter.of(context).go('/setting');
                            },
                            child: Icon(
                              Icons.settings,
                              color: Color(0xff0A2958),
                              size: 15,
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 221,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ) // vị trí đổ bóng: ngang và dọc
                            ]),
                        height: 221,
                        padding: EdgeInsets.all(7),
                        child: Column(
                          children: [
                            BlocBuilder<AppBloc, AppState>(
                              builder: (context, state) {
                                return Container(
                                  height: 151,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              state.thermometer))),
                                );
                              },
                            ),
                            Text(
                              '30°C/80°F',
                              style: TextStyle(
                                color: Color(0xff0A2958),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Feel like',
                              style: TextStyle(
                                color:
                                    Color(0xff0A2958BF).withValues(alpha: 0.75),
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '28°C/28°F',
                              style: TextStyle(
                                color:
                                    Color(0xff0A2958BF).withValues(alpha: 0.75),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 72,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'UV Index',
                                          style: TextStyle(
                                              color: Color(0xff0A2958)
                                                  .withValues(alpha: 0.25),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11),
                                        ),
                                        Text(
                                          '???',
                                          style: TextStyle(
                                              color: Color(0xff0A2958),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: 1,
                              decoration: BoxDecoration(
                                color: Color(0xffCED9DC),
                              ),
                            ),
                            SizedBox(
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Humidity',
                                          style: TextStyle(
                                              color: Color(0xff0A2958)
                                                  .withValues(alpha: 0.25),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11),
                                        ),
                                        Text(
                                          '???',
                                          style: TextStyle(
                                              color: Color(0xff0A2958),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ]),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: homeController.listhomeitem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OneeElementService(
                          homeitem: homeController.listhomeitem[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
