import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/setting_screen/controller/setting_controller.dart';
import 'package:weatherapp/setting_screen/component/setting_screen_item.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  
  SettingController settingController = SettingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Setting',link: '/'),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 180,
              child: ListView.builder(
                  itemCount: settingController.listSettingItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OneElementSettingScreen(settingItem: settingController.listSettingItem[index],);
                  }),
            )
          ],
        ),
      )),
    );
  }
}


