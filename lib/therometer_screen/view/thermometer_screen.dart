import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/therometer_screen/controller/thermometer_controller.dart';
import 'package:weatherapp/therometer_screen/component/thermometer_screen_item.dart';

class ThermometerScreen extends StatefulWidget {
  const ThermometerScreen({super.key});

  @override
  State<ThermometerScreen> createState() => _ThermometerScreenState();
}

class _ThermometerScreenState extends State<ThermometerScreen> {
  ThermometerController thermometerController = ThermometerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Thermometers', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 14,
              childAspectRatio: 0.6),
          itemCount: thermometerController.listThermometers.length,
          itemBuilder: (BuildContext context, int index) {
            final thermometerlist =
                thermometerController.listThermometers[index];
            return GestureDetector(
                onTap: () {
                  context.read<AppBloc>().add(
                      SetThermometerEvent(imageThermometer: thermometerlist));
                },
                child: OneElementThermometerScreen(image: thermometerlist.toString()));
          },
        ),
      )),
    );
  }
}
