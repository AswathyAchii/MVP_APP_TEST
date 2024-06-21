import 'package:flutter/material.dart';
import 'package:mvp_app/core/style/colors.dart';
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
    );
  }
}
