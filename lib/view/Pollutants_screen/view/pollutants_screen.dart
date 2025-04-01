import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/bloc/app_bloc/app_bloc.dart';
import '../../../util/pollutant_data.dart';
import '../../../widget/appbar_setting.dart';
import 'pollutants_screen_item.dart';


class PollutantsScreen extends StatefulWidget {
  const PollutantsScreen({super.key});

  @override
  State<PollutantsScreen> createState() => _PollutantsScreenState();
}

class _PollutantsScreenState extends State<PollutantsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Pollutants', link: '/'),
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
                        const SizedBox(
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 1 / 1),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: listPollutants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OneElementPollutant(
                          pollutants:
                             listPollutants[index],
                        );
                      },
                    ),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                    height: 111,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff0005141A).withValues(alpha: 0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(4, 4),
                          )
                        ]),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              Container(
                                height: 60,
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 15),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/greensmile.png'),
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  width: 1)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'There are 2 pollutants gas outside:',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff12203A),
                                ),
                              ),
                              Text(
                                'CO',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff12203A),
                                ),
                              ),
                              Text(
                                'NO2',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff12203A),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
