import 'package:flutter/material.dart';
import 'package:weatherapp/model/pollen.dart';
import 'package:weatherapp/pollen_screen/pollen_screen_item.dart';

class PollenScreen extends StatefulWidget {
  const PollenScreen({super.key});

  @override
  State<PollenScreen> createState() => _PollenScreenState();
}

class _PollenScreenState extends State<PollenScreen> {

  final List<Pollen> _listPollen = [
    Pollen('Alder Pollen', 'assets/images/pollenimage/alderpollen.png', 0xffC8F0DA),
    Pollen('Birch Pollen', 'assets/images/pollenimage/birchpollen.png', 0xffF9D5D3),
    Pollen('Grass Pollen', 'assets/images/pollenimage/grasspollen.png', 0xffF9F0E3),
    Pollen('Mugwort Pollen', 'assets/images/pollenimage/mugwortpollen.png', 0xffD4DAFA),
    Pollen('Olive Pollen', 'assets/images/pollenimage/olivepollen.png', 0xffD4FFBA),
    Pollen('Ragweed Pollen', 'assets/images/pollenimage/ragweedpollen.png', 0xffE5D4FA),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pollen',
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.place_outlined, color: Color(0xff12203A),size: 13,),
                    SizedBox(width: 5,),
                    Text('Hoài Đức, Hà Nội', style: TextStyle(
                      color: Color(0xff12203A),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text('14:51',style: TextStyle(
                color: Color(0xff12203A),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),),
              SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      childAspectRatio: 0.91
                    ),
                  itemCount: _listPollen.length,
                  itemBuilder: (BuildContext context, int index) {
                      return OneElementPollen(pollen: _listPollen[index]);
                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
