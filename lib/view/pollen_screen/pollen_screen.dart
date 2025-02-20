import 'package:flutter/material.dart';

class PollenScreen extends StatefulWidget {
  const PollenScreen({super.key});

  @override
  State<PollenScreen> createState() => _PollenScreenState();
}

class _PollenScreenState extends State<PollenScreen> {
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
    );
  }
}
