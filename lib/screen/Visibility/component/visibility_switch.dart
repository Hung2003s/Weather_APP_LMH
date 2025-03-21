import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/app_bloc/app_bloc.dart';

class VisibilitySwitch extends StatefulWidget {
  final bool isKilometer;
  final Function(bool) onUnitChange;
  final Color buttonColor;

  const VisibilitySwitch(
      {super.key,
      required this.isKilometer,
      required this.onUnitChange,
      required this.buttonColor});

  @override
  State<VisibilitySwitch> createState() => _VisibilitySwitchState();
}

class _VisibilitySwitchState extends State<VisibilitySwitch>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  final Duration _duration = Duration(milliseconds: 370);
  late Animation<Alignment> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );

    _animation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn,
      ),
    );
    if (widget.isKilometer) {
      _animationController.value = 0;
    } else {
      _animationController.value = 1;
    }
  }

  // @override
  // void didUpdateWidget(covariant VisibilitySwitch oldWidget) {
  //   // TODO: implement didUpdateWidget
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.isKilometer != oldWidget.isKilometer) {
  //     _animationController.forward();
  //   } else {
  //     _animationController.reverse();
  //   }
  // }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Km'),
        SizedBox(width: 10),
        BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  width: 110,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        spreadRadius: -12.0,
                        blurRadius: 12.0,
                      ),
                    ],
                    color: widget.buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: _animation.value,
                        child: GestureDetector(
                          onTap: () {
                            if (_animationController.isCompleted) {
                              _animationController.reverse();
                            } else {
                              _animationController.forward();
                            }
                            widget.onUnitChange(!widget.isKilometer);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffEBEBEB),
                                      blurRadius: 4,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        SizedBox(width: 10),
        Text('Mi'),
      ],
    );
  }
}
