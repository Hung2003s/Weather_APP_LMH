import 'dart:ui';

import 'package:flutter/material.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 490,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Container(
                        height: 460,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Color(0xff000000).withValues(
                                alpha: 0.2,
                              ),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 4))
                        ]),
                        child: ImageFiltered(
                          imageFilter:ImageFilter.blur(sigmaX: 10, sigmaY: 10,),
                          child: Image(image: AssetImage(
                              'assets/images/introimage/backgroundimage.png'),
                            fit: BoxFit.cover,)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/introimage/homescreenimage.png')),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 90,
                      //   width: MediaQuery.of(context).size.width,
                      //   decoration: BoxDecoration(
                      //     color: Colors.transparent,
                      //     shape: BoxShape.circle,
                      //     border: Border(bottom: BorderSide(color: Colors.white, width: 7))
                      //   ),
                      // ),


                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            image: AssetImage('assets/images/introimage/curveline.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff000000).withValues(
                                      alpha: 0.2,
                                    ),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 4))
                              ]),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff4BCFF9),
                                      Color(0xff5363F3),
                                    ])),
                            child: Image(
                                image: AssetImage(
                                    'assets/images/introimage/thermometericon.png')),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('All in one', style: TextStyle(
                    color: Color(0xff12203A),
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                ),),
                SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Weather forecast, Air quality, UV Index, Compass,Humidity', style: TextStyle(
                    color: Color(0xff12203A).withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                              Color(0xff28B2FF),
                              Color(0xff5363F3),
                            ])
                    ),
                    child: Center(
                      child: Text('CONTINUE', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
  Widget introItem( String image) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Color(0xff000000).withValues(
                  alpha: 0.2,
                ),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors: [
                  Color(0xff4BCFF9),
                  Color(0xff5363F3),
                ])),
        child: Image(
            image: AssetImage(image)),
      ),
    );
  }
}
