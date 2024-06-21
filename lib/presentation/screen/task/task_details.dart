import 'package:flutter/material.dart';
import 'package:mvp_app/core/global/constants.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/common.dart';
import 'package:mvp_app/core/style/text.dart';

class TaskDetailsPage extends StatefulWidget {
  final bool? isApproved;
  const TaskDetailsPage({
    super.key,
    this.isApproved = false,
  });

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
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
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
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
            ),
          ),
        ],

        ///-------- TITLE ----------//
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidgets.bodyText(text: 'Project Name', color: grey),
            Common.gHeight(5),
            TextWidgets.subHeading(
                text: 'Mvp Task Manager', color: primaryColor),
            Common.gHeight(5),
            Divider(color: greyLight, thickness: 2),
            TextWidgets.bodyText(text: 'Task Details', color: grey),
            Common.gHeight(5),
            TextWidgets.bodyText(
              text: 'Design Task Management App',
              color: primaryColor,
              fontSize: 13,
            ),
            Common.gHeight(5),
            Divider(color: greyLight, thickness: 2),
            TextWidgets.bodyText(text: 'Description', color: grey),
            Common.gHeight(5),
            TextWidgets.bodyText(
              text:
                  'Design Task management appp Design Task,Design Task management appp Design Task,Design Task management appp Design Task',
              color: primaryColor,
            ),
            Common.gHeight(5),
            Divider(color: greyLight, thickness: 2),
            Common.gHeight(5),
            if (widget.isApproved!) ...{} else ...{}
          ],
        ),
      ),
    );
  }
}
