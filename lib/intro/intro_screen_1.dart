import 'package:flutter/material.dart';


class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({super.key});

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
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
                  width: MediaQuery.of(context).size.width,
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
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                  height: 460,
                                  child: ClipRect(
                                    child: Transform.scale(
                                      scale: 4,
                                      alignment: Alignment(-0.4, 0),
                                      child: Image(
                                        image: AssetImage(
                                          'assets/images/introimage/image3.png',
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            Expanded(
                                child: Container(
                              child: Image(
                                image: AssetImage(
                                    'assets/images/introimage/image2.png'),
                                fit: BoxFit.cover,
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/introimage/imagge1.png')),
                          ),
                        ),
                      ),
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
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Indoor/Outdoor Temperature',
                  style: TextStyle(
                      color: Color(0xff12203A),
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Check temperature by smart thermometer',
                  style: TextStyle(
                    color: Color(0xff12203A).withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
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
                            ])),
                    child: Center(
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
