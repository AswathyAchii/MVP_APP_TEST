import 'package:flutter/material.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvp_app/core/global/variables.dart';
import 'package:mvp_app/core/style/routes.dart';
import 'package:mvp_app/core/style/text.dart';
import 'package:mvp_app/presentation/screen/auth/login_screen.dart';
import 'package:mvp_app/presentation/widget/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        if (Variables.userId.isNotEmpty) {
          /// if the userId is not empty which means user is already logged in. in that case will navigate to home page
          Navigator.pushAndRemoveUntil(
            context,
            CustomPageRoute.tweenRoute(const BottomNavigation()),
            (_) => false,
          );
        } else {
          /// if user is not logged in will navigate to Login page
          Navigator.pushAndRemoveUntil(
            context,
            CustomPageRoute.tweenRoute(const LoginPage()),
            (_) => false,
          );
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ------- LOGO -------//
          Container(
            margin: const EdgeInsets.all(120),
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: primaryColor, width: 3),
            ),
            child: Center(child: TextWidgets.heading(text: "MVP", fontSize: 40)),
          )
        ],
      ),
    );
  }
}
