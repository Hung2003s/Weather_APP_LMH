import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../util/setting_item_data.dart';
import '../../../widget/appbar_setting.dart';
import 'setting_screen_item.dart';



class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  

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
            Expanded(
              child: ListView.builder(
                  itemCount: listSettingItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(listSettingItem[index].linksetting);
                      },
                        child: OneElementSettingScreen(settingItem: listSettingItem[index],));
                  }),
            )
          ],
        ),
      )),
    );
  }
}


