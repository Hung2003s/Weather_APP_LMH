import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:weatherapp/model/setting_item.dart';
import 'package:weatherapp/setting_screen/setting_screen_item.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  
  final List<SettingItem> _listSettingItem = [
    SettingItem('Thermometers', 'assets/images/settingimage/thermometer.png',false,false,false ),
    SettingItem('Temperature', 'assets/images/settingimage/temperature.png', true, false, true),
    SettingItem('Themes', 'assets/images/settingimage/themes.png', false, false, false),
    SettingItem('Language', 'assets/images/settingimage/language.png', false,true,false),
    SettingItem('Modify my consent', 'assets/images/settingimage/modifymyconsent.png', false, false, false),
    SettingItem('Term of Condition', 'assets/images/settingimage/terms.png', false, false, false),
    SettingItem('Privacy', 'assets/images/settingimage/privacy.png', false, false, false),
    SettingItem('Contact us', 'assets/images/settingimage/contact.png', false, false, false),
    SettingItem('Share app', 'assets/images/settingimage/share.png', false, false, false),

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Setting'),
      backgroundColor: Color(0xffF5F6FC),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 180,
              child: ListView.builder(
                  itemCount: _listSettingItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OneElementSettingScreen(settingItem: _listSettingItem[index],);
                  }),
            )
          ],
        ),
      )),
    );
  }
}


