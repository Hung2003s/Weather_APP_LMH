import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/model/theme_item.dart';
import 'package:weatherapp/view/theme_screen/theme_item_screen.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  final List<ThemeItem> _listThemeItem =[
    ThemeItem('assets/images/themeimage/themepic1.jpg'),
    ThemeItem('assets/images/themeimage/themepic2.jpg'),
    ThemeItem('assets/images/themeimage/themepic3.jpg'),
    ThemeItem('assets/images/themeimage/themepic4.jpg'),
    ThemeItem('assets/images/themeimage/themepic5.jpg'),
    ThemeItem('assets/images/themeimage/themepic6.jpg'),
    ThemeItem('assets/images/themeimage/themepic7.jpg'),
    ThemeItem('assets/images/themeimage/themepic8.jpg'),
    ThemeItem('assets/images/themeimage/themepic9.png'),
    ThemeItem('assets/images/themeimage/themepic10.png'),
    ThemeItem('assets/images/themeimage/themepic11.png'),
    ThemeItem('assets/images/themeimage/themepic12.png'),
    ThemeItem('assets/images/themeimage/themepic13.jpg'),
    ThemeItem('assets/images/themeimage/themepic14.jpg'),
    ThemeItem('assets/images/themeimage/themepic15.jpg'),
    ThemeItem('assets/images/themeimage/themepic16.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Theme',
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
                  crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 20,
                childAspectRatio: 0.9
              ),
          itemCount: _listThemeItem.length,
          itemBuilder: (BuildContext context, int index) {
            return OneElementThemeScreen(themeItem: _listThemeItem[index],);
          },
        ),
      )
      ),
    );
  }

}

