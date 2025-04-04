import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/router.dart';
import '../../../util/intro_item_data.dart';
import 'intro_item.dart';




class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    currentIndex = index;
                  },
                  controller: controller,
                  itemCount: listIntro.length,
                  itemBuilder: (context, index) {
                    return IntroItem(
                      image: listIntro[index].image,
                      icon: listIntro[index].icon,
                      text1: listIntro[index].text1,
                      text2: listIntro[index].text2,
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (currentIndex == listIntro.length - 1) {
                    GoRouter.of(context).push(AppRouter.homeScreen);
                  } else {
                    controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xff28B2FF), Color(0xff5363F3)],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
