import 'package:flutter/material.dart';
import 'package:TTCYL/pages/MotivationMenu.dart';
import 'package:TTCYL/pages/bookmenu.dart';
import 'package:TTCYL/pages/financemenu.dart';
import 'package:TTCYL/pages/settingsmenu.dart';
import 'pages/todolistmenu.dart';

import 'pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => Todolistmenu(),
        '/third': (context) => BookMenu(),
        '/fourth': (context) => MotvMenu(),
        '/finance': (context) => FinanceMenu(),
        '/about': (context) => SettingsMenu()
      },
      title: 'TTCYL Beta Version',
      theme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Color.fromRGBO(16, 18, 24, 1.0),
          fontFamily: 'Montserrat',
          accentColor: Colors.white),
    );
  }
}
