import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvp_app/core/global/constants.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/common.dart';
import 'package:mvp_app/core/style/text.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({super.key});

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,

        /// ------- BACK BUTTON  ------//
        leading: GestureDetector(
          onTap: () {
            // Navigator.pop(context);
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
        title: TextWidgets.subHeading(text: 'Time Line'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidgets.subHeading(text: "May,18\n24, Tuesday", fontSize: 27),
              projectItem(),
              Common.gHeight(20),
              Row(
                children: [
                  Expanded(child: projectTaskItem()),
                  Common.gWidth(20),
                  Expanded(child: projectTaskItem(priority: 'Low priority'))
                ],
              ),
              Common.gHeight(20),
              projectItem(),
              Common.gHeight(20),
              projectItem(),
              Common.gHeight(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectTaskItem({String? priority}) {
    return Container(
      decoration: BoxDecoration(color: secondaryColor, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade50,
          spreadRadius: 5,
          blurRadius: 20,
          offset: const Offset(0, 4), // changes position of shadow
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Common.gHeight(15),

            ///----- HEADER CONTAINER -------//
            Row(
              children: [
                Flexible(
                  child: TextWidgets.subHeading(
                      text: 'Meeting with client', fontSize: 12),
                ),
                const Spacer(),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: grey),
                  ),
                  child: const Center(
                    child: Icon(Icons.more_horiz_rounded, size: 22),
                  ),
                ),
              ],
            ),
            Common.gHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidgets.bodyText1(text: 'Time', fontSize: 10, color: grey),
                TextWidgets.bodyText1(
                    text: '11:00Pm', fontSize: 10, color: primaryColor),
              ],
            ),
            Common.gHeight(15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: secondaryColor,
                border: Border.all(color: primaryColor, width: .3),
              ),
              height: 25,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Common.gWidth(6),
                  TextWidgets.bodyText(
                      text: priority ?? "High Priority",
                      color: primaryColor,
                      fontSize: 12),
                ],
              ),
            ),

            Common.gHeight(15),
            Container(
              height: 20,
              width: double.infinity,
              color: greyLight,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextWidgets.bodyText(text: "www.https://zoom.us/"),
                    ),
                    Common.gWidth(3),
                    const Icon(Icons.copy, color: primaryColor, size: 12)
                  ],
                ),
              ),
            ),

            Common.gHeight(10),
          ],
        ),
      ),
    );
  }

  Widget projectItem({String? status}) {
    return Container(
      decoration: BoxDecoration(color: secondaryColor, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade50,
          spreadRadius: 5,
          blurRadius: 20,
          offset: const Offset(0, 4), // changes position of shadow
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Common.gHeight(15),

            ///----- HEADER CONTAINER -------//
            Row(
              children: [
                TextWidgets.subHeading(
                    text: 'MVP Mobile App Design', fontSize: 14),
                const Spacer(),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: grey),
                  ),
                  child: const Center(
                    child: Icon(Icons.more_horiz_rounded, size: 22),
                  ),
                ),
              ],
            ),
            Common.gHeight(10),
            TextWidgets.bodyText1(
                text: 'Task planner App with clean and modern...',
                fontSize: 10),
            Common.gHeight(10),
            imageStack(),
            Common.gHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidgets.bodyText(
                    text: 'Progress',
                    fontSize: 12,
                    color: Colors.grey.shade700),
                TextWidgets.bodyText(
                    text: '64%', fontSize: 12, color: Colors.grey.shade700),
              ],
            ),
            Common.gHeight(10),
            SizedBox(
              height: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: greyLight,
                        borderRadius: BorderRadius.circular(2)),
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(2)),
                    width: 120,
                  ),
                ],
              ),
            ),
            Common.gHeight(10),
          ],
        ),
      ),
    );
  }

  /// IMAGE STACK UI
  Widget imageStack() {
    return SizedBox(
      height: 35,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            left: 0,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile1.jpeg"),
              radius: 16,
            ),
          ),
          const Positioned(
            left: 20,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile2.jpeg"),
              radius: 16,
            ),
          ),
          const Positioned(
            left: 40,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile3.jpeg"),
              radius: 16,
            ),
          ),
          const Positioned(
            left: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile4.jpeg"),
              radius: 16,
            ),
          ),
          Positioned(
            left: 80,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(child: TextWidgets.bodyText1(text: '2+')),
            ),
          ),
        ],
      ),
    );
  }
}
