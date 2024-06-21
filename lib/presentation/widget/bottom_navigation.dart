import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvp_app/core/global/constants.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/text.dart';
import 'package:mvp_app/presentation/screen/account/account_screen.dart';
import 'package:mvp_app/presentation/screen/home/home_screen.dart';
import 'package:mvp_app/presentation/screen/project/Project.dart';
import 'package:mvp_app/presentation/screen/time_line/time_line.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> screens = const [
    HomePage(),
    ProjectPage(),
    TimeLinePage(),
    AccountPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.shade50,
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(-2, -5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: padding, right: padding, bottom: 10, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              bottomNavigationItem(index: 0, icon: Icons.home_filled, title: 'Home'),
              bottomNavigationItem(index: 1, icon: Icons.folder_open, title: 'Projects'),
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                child: const Icon(
                  Icons.add,
                  color: secondaryColor,
                  size: 35,
                ),
              ),
              bottomNavigationItem(index: 2, icon: Icons.calendar_month, title: 'Time Line'),
              bottomNavigationItem(index: 3, icon: Icons.person_2_outlined, title: 'Account'),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationItem({required String title, required IconData icon, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: SizedBox(
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26,
              color: currentIndex == index ? primaryColor : Colors.grey.shade400,
            ),
            TextWidgets.subHeading(
              text: title,
              fontSize: 10,
              color: currentIndex == index ? primaryColor : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
