import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp_app/core/global/constants.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/common.dart';
import 'package:mvp_app/core/style/text.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
        title: TextWidgets.subHeading(text: 'Projects'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          children: [
            searchBar(),
            Common.gHeight(20),
            Expanded(
              child: ListView(
                children: [
                  projectItem(),
                  Common.gHeight(10),
                  projectItem(status: 'Work on'),
                  Common.gHeight(10),
                  projectItem(),
                  Common.gHeight(10),
                  projectItem(),
                  Common.gHeight(10),
                  projectItem(),
                  Common.gHeight(10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container projectItem({String? status}) {
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
            headerContainer(),
            Common.gHeight(10),
            TextWidgets.bodyText1(text: 'Task planner App with clean and modern...', fontSize: 12),
            Common.gHeight(10),
            imageStack(),
            Common.gHeight(10),
            middleContainer(status: status ?? "Pending"),
            Common.gHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidgets.bodyText(text: 'Progress', fontSize: 12, color: Colors.grey.shade700),
                TextWidgets.bodyText(text: '64%', fontSize: 12, color: Colors.grey.shade700),
              ],
            ),
            Common.gHeight(10),
            SizedBox(
              height: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: greyLight, borderRadius: BorderRadius.circular(2)),
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2)),
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

  /// Priority and status
  Widget middleContainer({String? status}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
              TextWidgets.bodyText(text: "High Priority", color: primaryColor, fontSize: 12),
            ],
          ),
        ),
        TextWidgets.bodyText(
            text: status ?? 'Pending',
            fontSize: 12,
            color: status == 'Work on' ? Colors.greenAccent.shade400 : Colors.orange)
      ],
    );
  }

  /// header UI
  Widget headerContainer() {
    return Row(
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: grey, width: .4),
                image: const DecorationImage(image: AssetImage("assets/projects.png")),
              ),
            ),
            Common.gWidth(10),
            TextWidgets.subHeading(text: 'Kudos Website', fontSize: 14),
          ],
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

  /// SEARCH BAR WIDGET
  Widget searchBar() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_sharp, size: 23),
        contentPadding: const EdgeInsets.only(left: 14, right: 14),
        fillColor: Colors.grey.shade50,
        filled: true,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        hintText: 'Search your task',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
