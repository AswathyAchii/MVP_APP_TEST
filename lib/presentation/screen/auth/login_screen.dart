/*
DESCRIPTION: This is LOGIN page where user can enter email and password to login. 
*/
import 'package:flutter/material.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/common.dart';
import 'package:mvp_app/core/style/routes.dart';
import 'package:mvp_app/core/style/text.dart';
import 'package:mvp_app/presentation/widget/bottom_navigation.dart';
import 'package:mvp_app/presentation/widget/common_button.dart';
import 'package:mvp_app/presentation/widget/common_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Common.gHeight(30),

              /// ------- LOGO -------//
              Container(
                margin: const EdgeInsets.all(90),
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: primaryColor, width: 4),
                ),
                child: Center(child: TextWidgets.heading(text: "MVP", fontSize: 45)),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///----- Welcome Text ----//
                    Common.gHeight(30),
                    TextWidgets.subHeading(text: "Welcome back", fontSize: 16),
                    Common.gHeight(5),
                    TextWidgets.bodyText1(text: "Please Enter your email and password to login"),
                    Common.gHeight(25),

                    ///--------- EMAIL ADDRESS FIELD --------//
                    const CommonTextField(hintText: 'Email address'),
                    Common.gHeight(25),

                    ///--------- PASSWORD FIELD --------//
                    const CommonTextField(hintText: 'Password'),
                    Common.gHeight(40),

                    ///--------- LOGIN BUTTON --------//
                    CommonLongButton(
                      onPress: () {
                        /// Navigating to HOME PAGE
                        Navigator.pushAndRemoveUntil(
                          context,
                          CustomPageRoute.tweenRoute(const BottomNavigation()),
                          (_) => false,
                        );
                      },
                      buttonName: 'Login',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
