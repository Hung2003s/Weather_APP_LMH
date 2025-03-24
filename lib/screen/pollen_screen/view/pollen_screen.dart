import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import '../component/pollen_screen_item.dart';
import '../controller/pollen_controller.dart';

class PollenScreen extends StatefulWidget {
  const PollenScreen({super.key});

  @override
  State<PollenScreen> createState() => _PollenScreenState();
}

class _PollenScreenState extends State<PollenScreen> {
  PollenController pollenController = PollenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Pollen', link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: SingleChildScrollView(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Color(0xff12203A),
                          size: 13,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${state.locationName}',
                          style: TextStyle(
                            color: Color(0xff12203A),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '14:51',
                    style: TextStyle(
                      color: Color(0xff12203A),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1 / 1),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pollenController.listPollen.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OneElementPollen(
                            pollen: pollenController.listPollen[index]);
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
