import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherforecastScreen extends StatefulWidget {
  const WeatherforecastScreen({super.key});

  @override
  State<WeatherforecastScreen> createState() => _WeatherforecastScreenState();
}

class _WeatherforecastScreenState extends State<WeatherforecastScreen> {
  bool isCelcius = true;
  bool light = true;

  @override
  Widget build(BuildContext context) {
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
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              )),
        ),
        actions: [
          Container(
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
                    setState(() {
                      isCelcius = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                        color: isCelcius ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Text(
                        'C',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: isCelcius
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
                    setState(() {
                      isCelcius = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                        color: isCelcius ? Colors.transparent : Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: Text(
                        'F',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: isCelcius
                                ? Color(0xff6D6D6D)
                                : Color(0xff8BC12D),
                            height: 0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
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
                              image: AssetImage('assets/images/locationicon.png'),
                            ),
                          ),
                          SizedBox(width: 10,),
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
                    SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFD900).withValues(alpha: 0.1)
                      ),
                      child: Image(
                          image: AssetImage('assets/images/sunshine.png'),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('25oC',style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 64,
                      color: Color(0xff12203A)
                    ),),
                    SizedBox(height: 10,),
                    Text('Feel like 28OC', style: TextStyle(
                      color: Color(0xff12203A).withValues(alpha: 0.54),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
              ),
              Container(
                height: 90,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('Another 7 days', style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return weatherforecastitem();
                          }),
                    )
                  ],
                ),
              )
            ],
                    ),
                  ),
          )),
    );
  }
  Widget weatherforecastitem() {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withValues(alpha: 0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4)
          )
        ]
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('MON',style: TextStyle(
                color: Color(0xff12203A).withValues(alpha: 0.54),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),),
            ),
            
            Container(
              child:Row(
                children: [
                  Text('25o', style: TextStyle(
                    color: Color(0xff12203A),
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                  ),),
                  SizedBox(width: 4,),
                  Text('28o', style: TextStyle(
                      color: Color(0xff12203A).withValues(alpha: 0.54),
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),)
                ],
              ),
            ),
            SizedBox(width: 40,),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Image(
                        image: AssetImage('assets/images/rainicon.png')),
                  ),
                  Text('Rain',style: TextStyle(
                    color: Color(0xff12203A).withValues(alpha: 0.54),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),)
                ],
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}
