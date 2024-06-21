import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvp_app/core/global/constants.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/core/style/common.dart';
import 'package:mvp_app/core/style/routes.dart';
import 'package:mvp_app/core/style/text.dart';
import 'package:mvp_app/presentation/screen/account/notification.dart';
import 'package:mvp_app/presentation/widget/common_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: secondaryColor,

      ///---------- APP BAR ----------------//
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///  welcome message
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidgets.bodyText1(text: "Good Morning, Kyle!"),
                Common.gHeight(5),
                TextWidgets.subHeading(text: "Let's Start your task", fontSize: 16),
              ],
            ),
            const Spacer(),

            ///  NOTIFICATION BUTTON
            CommonIconButton(
              onPress: () {
                Navigator.push(context, CustomPageRoute.routeFromRight(const NotificationPage()));
              },
              icon: Icons.notifications_none,
              isStack: true,
            )
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(size, 120.0),
          child: Column(
            children: [
              searchBar(),
              Common.gHeight(10),
              tabBarWidget(size),
            ],
          ),
        ),
      ),

      ///---------- BODY ----------------//
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
          controller: tabController,
          children: [
            todayTabBarView(), //today
            historyTabBarView(), //history
          ],
        ),
      ),

      ///-------- BOTTOM NAVIGATION BAR -----//
    );
  }

  /// TAB BAR WIDGET
  TabBar tabBarWidget(double size) {
    return TabBar(
      labelColor: primaryColor,
      unselectedLabelColor: grey,
      indicator: UnderlineTabIndicator(
          borderSide: const BorderSide(width: 1), insets: EdgeInsets.symmetric(horizontal: size / 3)),
      labelStyle: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      controller: tabController,
      tabs: const [
        Tab(text: 'Today'),
        Tab(text: 'History'),
      ],
    );
  }

  /// SEARCH BAR WIDGET
  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: padding, right: padding),
      child: TextFormField(
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
      ),
    );
  }

  /// TODAY TAB VIEW UI
  Widget todayTabBarView() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            itemWidget(icon: Icons.play_arrow, isHistory: false, date: "Today, 10.00 am"),
            Common.gHeight(15),
            itemWidget(icon: Icons.pause, isHistory: false, date: "Today, 10.00 am"),
          ],
        ),
      ),
    );
  }

  /// HISTORY TAB VIEW UI
  Widget historyTabBarView() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            itemWidget(icon: Icons.check, isHistory: true, date: "Apr 20-2024, 10:00 am"),
            Common.gHeight(15),
            itemWidget(icon: Icons.check, isHistory: true, date: "Apr 20-2024, 10:00 am"),
          ],
        ),
      ),
    );
  }

  /// Widget which shows content in the tabBarViewCard
  Widget itemWidget({required IconData icon, required bool isHistory, required String date}) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade50,
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ------TYPE
            Container(
              height: 22,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: TextWidgets.bodyText(text: 'UI ux Design', fontSize: 9)),
            ),
            Common.gHeight(20),

            /// ------- TASK NAME & TASK
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidgets.subHeading(text: "Design Task management App", fontSize: 14),
                    Common.gHeight(5),
                    TextWidgets.bodyText1(text: "Redesign fashion app for up dribble", fontSize: 12)
                  ],
                ),
                const Spacer(),
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                  child: Center(
                    child: Icon(icon, color: secondaryColor, size: 15),
                  ),
                )
              ],
            ),
            Common.gHeight(4),
            Divider(color: greyLight, thickness: 1.5),
            Common.gHeight(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// ------- DATE  ------//
                TextWidgets.bodyText1(text: date, fontSize: 13),
                if (isHistory) ...[
                  /// ------- POINTS  ------//
                  TextWidgets.bodyText1(text: "5 points", fontSize: 13),
                ],

                /// ------- DURATION  ------//
                TextWidgets.bodyText1(text: "5 hours", fontSize: 13),
              ],
            )
          ],
        ),
      ),
    );
  }
}
