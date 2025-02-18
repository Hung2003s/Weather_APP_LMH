import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {



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
                Container(
                  height: 534,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/homepage_image.jpg'),
                    fit: BoxFit.fitHeight,
                  )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 530),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color(0xffF4FAFA).withOpacity(0.2),
                Colors.white.withOpacity(0.1),
              ])),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 5),
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
                            onTap: () {},
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
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ) // vị trí đổ bóng: ngang và dọc
                            ]),
                        height: 221,
                        padding: EdgeInsets.all(7),
                        child: Column(
                          children: [
                            Container(
                              height: 151,
                              width: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/framethermometer1.png'))),
                            ),
                            Text(
                              '30oC/80oF',
                              style: TextStyle(
                                color: Color(0xff0A2958),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Feel like',
                              style: TextStyle(
                                color: Color(0xff0A2958BF).withOpacity(0.75),
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '28oC/28oF',
                              style: TextStyle(
                                color: Color(0xff0A2958BF).withOpacity(0.75),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 72,
                        width: 232,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
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
                                                'assets/images/uvlogo.png'))),
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
                                                  .withOpacity(0.25),
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
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: 1,
                              decoration: BoxDecoration(
                                color: Color(0xffCED9DC),
                              ),
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
                                                'assets/images/humiditylogo.png'))),
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
                                                  .withOpacity(0.25),
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
                SizedBox(height: 30,),
                Container(
                  height: 290,
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ]
                  ),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container();
                      }),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

}
