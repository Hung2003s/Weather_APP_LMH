import 'package:flutter/material.dart';
import 'package:weatherapp/model/thermometer.dart';
import 'package:weatherapp/view/therometer_screen/thermometer_screen_item.dart';

class ThermometerScreen extends StatefulWidget {
  const ThermometerScreen({super.key});

  @override
  State<ThermometerScreen> createState() => _ThermometerScreenState();
}

class _ThermometerScreenState extends State<ThermometerScreen> {

  final List<Thermometers> _listThermometers = [
    Thermometers('assets/images/thermometerimage/thermometer1.png'),
    Thermometers('assets/images/thermometerimage/thermometer2.png'),
    Thermometers('assets/images/thermometerimage/thermometer3.png'),
    Thermometers('assets/images/thermometerimage/thermometer4.png'),
    Thermometers('assets/images/thermometerimage/thermometer5.png'),
    Thermometers('assets/images/thermometerimage/thermometer6.png'),
    Thermometers('assets/images/thermometerimage/thermometer7.png'),
    Thermometers('assets/images/thermometerimage/thermometer8.png'),
    Thermometers('assets/images/thermometerimage/thermometer9.png'),
    Thermometers('assets/images/thermometerimage/thermometer10.png'),
    Thermometers('assets/images/thermometerimage/thermometer11.png'),
    Thermometers('assets/images/thermometerimage/thermometer12.png'),
    Thermometers('assets/images/thermometerimage/thermometer13.png'),
    Thermometers('assets/images/thermometerimage/thermometer14.png'),
    Thermometers('assets/images/thermometerimage/thermometer15.png'),
    Thermometers('assets/images/thermometerimage/thermometer16.png'),
    Thermometers('assets/images/thermometerimage/thermometer17.png'),
    Thermometers('assets/images/thermometerimage/thermometer18.png'),
    Thermometers('assets/images/thermometerimage/thermometer19.png'),
    Thermometers('assets/images/thermometerimage/thermometer20.png'),
    Thermometers('assets/images/thermometerimage/thermometer21.png'),
    Thermometers('assets/images/thermometerimage/thermometer22.png'),
    Thermometers('assets/images/thermometerimage/thermometer23.png'),
    Thermometers('assets/images/thermometerimage/thermometer24.png'),
    Thermometers('assets/images/thermometerimage/thermometer25.png'),
    Thermometers('assets/images/thermometerimage/thermometer26.png'),
    Thermometers('assets/images/thermometerimage/thermometer27.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Thermometers',
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
      ),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 14,
                  childAspectRatio: 0.6
              ),
              itemCount: _listThermometers.length,
              itemBuilder: (BuildContext context, int index) {
                return OneElementThermometerScreen(thermometers: _listThermometers[index]);
              },
            ),
          )
      ),
    );
  }
}
