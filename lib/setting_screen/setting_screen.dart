import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/model/setting_item.dart';
import 'package:weatherapp/setting_screen/setting_screen_item.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  
  final List<SettingItem> _listSettingItem = [
    SettingItem('Thermometers', 'assets/images/settingimage/thermometer.png', ''),
    SettingItem('Temperature', 'assets/images/settingimage/temperature.png', ''),
    SettingItem('Themes', 'assets/images/settingimage/themes.png', ''),
    SettingItem('Language', 'assets/images/settingimage/language.png', ''),
    SettingItem('Modify my consent', 'assets/images/settingimage/modifymyconsent.png', ''),
    SettingItem('Term of Condition', 'assets/images/settingimage/terms.png', ''),
    SettingItem('Privacy', 'assets/images/settingimage/privacy.png', ''),
    SettingItem('Contact us', 'assets/images/settingimage/contact.png', ''),
    SettingItem('Share app', 'assets/images/settingimage/share.png', ''),

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Setting',
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


