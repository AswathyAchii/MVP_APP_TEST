import 'package:flutter/material.dart';
import 'package:mvp_app/core/global/constants.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/common.dart';
import 'package:mvp_app/core/style/text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,

        /// ------- BACK BUTTON  ------//
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryColor),
              ),
              child: const Center(
                child: Icon(Icons.arrow_back, size: 20),
              ),
            ),
          ),
        ),

        ///-------- TITLE ----------//
        title: TextWidgets.subHeading(text: 'Notification'),
        centerTitle: true,
      ),

      /// ------- BODY  ------//
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            children: [
              notificationItemWidget(),
              Common.gHeight(15),
              notificationItemWidget(),
              Common.gHeight(15),
              notificationItemWidget(),
              Common.gHeight(15),
              notificationItemWidget(),
              Common.gHeight(15),
              notificationItemWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget notificationItemWidget() {
    return Container(
      decoration: BoxDecoration(color: secondaryColor, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade50,
          spreadRadius: 5,
          blurRadius: 20,
          offset: const Offset(0, 4), // changes position of shadow
        ),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///----- PIC -------//
                Row(
                  children: [
                    const CircleAvatar(backgroundImage: AssetImage("assets/notification.jpeg")),
                    Common.gWidth(10),
                    TextWidgets.subHeading(text: 'Araby ai', fontSize: 14),
                  ],
                ),

                ///----- DESCRIPTION -------//
                Common.gHeight(5),
                TextWidgets.bodyText1(text: 'Task planner App with clean and modern..', fontSize: 12),
              ],
            ),
          ),
          const Divider(thickness: .2, color: grey, height: 5),
          Common.gHeight(5),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///----- LINK VIEW -------//
                TextWidgets.subHeading(text: 'Link Preview', fontSize: 12),
                Common.gHeight(5),
                TextWidgets.bodyText1(
                  text: 'www.update username home and profile, edit password',
                  fontSize: 12,
                ),
                Common.gHeight(10),
                Row(
                  children: [
                    ///----- APPROVE BUTTON -------//
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: primaryColor),
                        height: 25,
                        width: 90,
                        child: Center(
                          child: TextWidgets.bodyText(text: "Approve", color: secondaryColor, fontSize: 12),
                        ),
                      ),
                    ),
                    Common.gWidth(20),

                    ///----- DENY BUTTON -------//
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: secondaryColor,
                          border: Border.all(color: primaryColor),
                        ),
                        height: 25,
                        width: 60,
                        child: Center(
                          child: TextWidgets.bodyText(text: "Deny", color: primaryColor, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                Common.gHeight(10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
