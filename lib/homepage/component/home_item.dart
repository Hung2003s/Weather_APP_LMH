

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/app_service.dart';


class OneeElementService extends StatelessWidget {
  final AppService homeitem;
  const OneeElementService({super.key, required this.homeitem});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).go(homeitem.link);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ]),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(homeitem.color), shape: BoxShape.circle),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(homeitem.logo))),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                homeitem.name,
                style: TextStyle(
                    color: Color(0xff081D3F),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 0.9
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}