import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp_app/core/global/constants.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/common.dart';
import 'package:mvp_app/core/style/routes.dart';
import 'package:mvp_app/core/style/text.dart';
import 'package:mvp_app/presentation/screen/account/notification.dart';
import 'package:mvp_app/presentation/screen/auth/login_screen.dart';
import 'package:mvp_app/presentation/widget/common_button.dart';
import 'package:mvp_app/presentation/widget/common_text_field.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            children: [
              Common.gHeight(60),

              ///----- USER INFO--------//
              Center(
                child: Column(
                  children: [
                    TextWidgets.subHeading(text: 'Kyle Calica', fontSize: 16), // user name
                    TextWidgets.bodyText1(text: 'nathan@mvp-apps.com', fontSize: 12), // user id
                  ],
                ),
              ),
              Common.gHeight(60),

              ///----- EDIT PASSWORD  --------//
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.shade50,
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// PASSWORD
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidgets.subHeading(text: 'PassWord', fontSize: 14),
                              TextWidgets.bodyText1(text: '***********', fontSize: 13),
                            ],
                          ),

                          /// EDIT BUTTON
                          TextButton(
                            onPressed: () {
                              editPasswordDialog(context);
                            },
                            child: TextWidgets.bodyText1(text: 'Edit', fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Common.gHeight(15),

              ///----- Other Options Container --------//
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.shade50,
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ///------- NOTIFICATION -----//
                        listItemWidget(
                          icon: Icons.notifications_none,
                          title: 'Notification',
                          onTap: () {
                            Navigator.push(context, CustomPageRoute.routeFromLeft(const NotificationPage()));
                          },
                        ),
                        Divider(color: greyLight, thickness: 2),

                        ///------- DARK MODE -----//
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            listItemWidget(
                              icon: Icons.dark_mode_outlined,
                              title: 'Dark mode',
                              onTap: () {},
                            ),
                            const Spacer(),

                            ///------- TOGGLE BUTTON -----//
                            Transform.scale(
                              scale: 1,
                              child: Switch(
                                onChanged: (v) {
                                  setState(() {
                                    isDarkMode = v;
                                  });
                                },
                                value: isDarkMode,
                              ),
                            )
                          ],
                        ),
                        Divider(color: greyLight, thickness: 2),

                        ///------- LOG OUT -----//
                        listItemWidget(
                          icon: Icons.login,
                          title: 'Logout',
                          onTap: () {
                            logoutDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Dialog box to ask logout confirmation
  Future<dynamic> logoutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: secondaryColor,
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
                  children: [
                    ///----- HEADING AND CLOSE BUTTON --------//
                    Row(
                      children: [
                        const Spacer(),
                        TextWidgets.subHeading(text: 'Logout', fontSize: 16),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: primaryColor),
                            ),
                            child: const Center(
                              child: Icon(Icons.close, size: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                    Common.gHeight(30),

                    /// -------- SUB TITLE -----//
                    TextWidgets.bodyText1(text: "Are You sure you want to logout?", fontSize: 16),

                    ///----- YES BUTTON -----//
                    Common.gHeight(30),
                    CommonLongButton(
                        buttonName: 'Yes',
                        onPress: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CustomPageRoute.tweenRoute(const LoginPage()),
                            (_) => false,
                          );
                        }),
                    Common.gHeight(15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor,
                            border: Border.all(color: primaryColor)),
                        height: 40,
                        width: double.infinity,
                        child: Center(
                          child: TextWidgets.bodyText(text: 'No', fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  /// Dialog box to ask edit password confirmation
  Future<dynamic> editPasswordDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: secondaryColor,
            child: SizedBox(
              height: 280,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///----- HEADING AND CLOSE BUTTON --------//
                    Row(
                      children: [
                        const Spacer(),
                        TextWidgets.subHeading(text: 'Edit Password', fontSize: 16),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: primaryColor),
                            ),
                            child: const Center(
                              child: Icon(Icons.close, size: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                    Common.gHeight(30),

                    /// -------- SUB TITLE -----//
                    Text(
                      "Please enter your email account to send code !",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Common.gHeight(15),
                    const CommonTextField(
                      hintText: 'Email',
                    ),

                    ///----- Submit BUTTON -----//
                    Common.gHeight(30),
                    CommonLongButton(
                      buttonName: 'Submit',
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget listItemWidget({required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 160,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 30),
            Common.gWidth(15),
            TextWidgets.bodyText1(text: title),
          ],
        ),
      ),
    );
  }
}
