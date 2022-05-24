import 'package:flutter/material.dart';
import 'package:help/choose.dart';
import 'package:help/freq_dist.dart';
import 'package:help/rates.dart';
import 'package:help/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild MainApp");

    return MaterialApp(
        title: "Отчёты",
        home: const ChooseScreen(),
        theme: CustomTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: "/choose",
        routes: {
          "/choose": (context) {
            return const ChooseScreen();
          },
          "/freq_dist": (context) {
            return FreqDist();
          },
          "/rates": (context) {
            return Rates();
          },
        });
  }
}
