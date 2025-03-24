import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../util/thermometer_data.dart';
import '../../../widget/appbar_setting.dart';
import 'thermometer_screen_item.dart';


class ThermometerScreen extends StatefulWidget {
  const ThermometerScreen({super.key});

  @override
  State<ThermometerScreen> createState() => _ThermometerScreenState();
}

class _ThermometerScreenState extends State<ThermometerScreen> {
  int selectindex = 0;
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
          itemCount: listThermometers.length,
          itemBuilder: (BuildContext context, int index) {
            final thermometer = listThermometers[index];
            return GestureDetector(
                onTap: () {
                  context.read<AppBloc>().add(SetThermometerEvent(imageThermometer: thermometer));
                setState(() {
                    selectindex = index;
                  });
                },
                child: OneElementThermometerScreen(
                image: thermometer.toString(),
                choose: selectindex == index,),
            );
          },
        ),
      )),
    );
  }
}
