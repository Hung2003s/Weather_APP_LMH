import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarSetting extends StatelessWidget implements PreferredSizeWidget {
  final String titletext;
  final String link;
  const AppbarSetting({super.key, required this.titletext, required this.link});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffF5F6FC),
      centerTitle: true,
      title: Text(
        titletext,
        style: TextStyle(
          color: Color(0xff12203A),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
          ),
        ),
      ),
    );
  }


}
