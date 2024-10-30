import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webapp_frontend/screens/home/home_screen.dart';
import 'package:webapp_frontend/widgets/menu_button.dart';
import 'package:webapp_frontend/widgets/side_menu_bar.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  bool isSideMenuClosed = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          width: 288,
          left: isSideMenuClosed ? -288 : 0,
          height: MediaQuery.of(context).size.height,
          child: SideMenuBar(),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value - animation.value * 30 * pi / 180),
          child: Transform.translate(
            offset: Offset(animation.value * 265, 0),
            child: Transform.scale(
              scale: scaleAnimation.value,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                child: const HomeScreen(),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 150),
          curve: Curves.fastOutSlowIn,
          left: isSideMenuClosed ? 0 : 220,
          top: 16,
          child: MenuButton(
            press: () {
              if (isSideMenuClosed) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              setState(() {
                isSideMenuClosed = !isSideMenuClosed;
              });
            },
          ),
        ),
      ]),
    );
  }
}
