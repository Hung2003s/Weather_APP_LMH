
import 'package:flutter/material.dart';
import 'package:weatherapp/app_bloc/app_bloc.dart';
import 'package:weatherapp/components/appbar_setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/theme_item_screen.dart';
import '../controller/theme_controller.dart';


class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  ThemeController themeController = ThemeController();
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSetting(titletext: 'Theme',link: '/setting'),
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
          itemCount: themeController.listThemeItem.length,
          itemBuilder: (BuildContext context, int index) {
            final theme = themeController.listThemeItem[index].toString();
            return GestureDetector(
              onTap: () {
                context.read<AppBloc>().add(SetThemeEvent(imageTheme: theme));
                // GoRouter.of(context).go(AppRouter.homeScreen);
                setState(() {
                  selectedIndex = index;
                });
              },
              child: OneElementThemeScreen(
                image: themeController.listThemeItem[index].toString(),
                choose: selectedIndex == index,
              ),
            );
          },
        ),
      )
      ),
    );
  }

}

