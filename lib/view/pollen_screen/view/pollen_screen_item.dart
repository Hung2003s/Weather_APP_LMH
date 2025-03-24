import 'package:flutter/material.dart';
import '../../../model/pollen.dart';

class OneElementPollen extends StatefulWidget {
  final Pollen pollen;
  const OneElementPollen({super.key, required this.pollen});

  @override
  State<OneElementPollen> createState() => _OneElementPollenState();
}

class _OneElementPollenState extends State<OneElementPollen> {
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
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Color(widget.pollen.color),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image(
                      image: AssetImage(widget.pollen.image)),
                  ),
                SizedBox(height: 15,),
                Container(
                  child: Text(widget.pollen.name, style: TextStyle(
                    color: Color(0xff12203ABF).withValues(alpha: 0.75),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),),
                ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff000000).withValues(alpha: 0.1), width: 1),
              color: Color(0xff000000).withValues(alpha: 0.1),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 20,),
            child: Text('No Data',style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff12203A),
              fontSize: 16,
            ),),
          )
        ],
      ),
    );
  }
}
