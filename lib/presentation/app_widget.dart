import 'package:flutter/material.dart';
import 'package:mvp_app/core/style/colors.dart';
import 'package:mvp_app/presentation/screen/splash/splash_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVP',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, primary: primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
