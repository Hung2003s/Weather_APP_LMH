import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarSetting extends StatelessWidget implements PreferredSizeWidget {
  final String titletext;
  const AppbarSetting({super.key, required this.titletext});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        titletext,
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
    );
  }


}
