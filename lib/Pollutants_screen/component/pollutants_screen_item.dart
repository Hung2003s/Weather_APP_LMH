
import 'package:flutter/material.dart';
import 'package:weatherapp/Pollutants_screen/model/pollutants.dart';

class OneElementPollutant extends StatefulWidget {
  final Pollutants pollutants;

  const OneElementPollutant({super.key, required this.pollutants});

  @override
  State<OneElementPollutant> createState() => _OneElementPollutantState();
}

class _OneElementPollutantState extends State<OneElementPollutant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff0005141A).withValues(alpha: 0.1),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(4, 4),
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        color: Color(widget.pollutants.color),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color(widget.pollutants.color).withValues(alpha: 0.1),
                            spreadRadius: 0,
                            blurRadius: 4,
                            // offset: Offset(4, 4),
                          ),
                        ]),
                    child: Text(
                      widget.pollutants.name,
                      style: TextStyle(
                          color: Color(widget.pollutants.textcolor),
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xff000000).withValues(alpha: 0.1), width: 1),
              color: Color(0xff000000).withValues(alpha: 0.1),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    widget.pollutants.value.toString(),
                    style: TextStyle(
                      color: Color(0xff12203A),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'µg/m3',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff12203A).withValues(alpha: 0.75),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
