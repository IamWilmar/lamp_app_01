import 'package:flutter/material.dart';
import 'package:lamp_app_01/src/pages/home_page.dart';
import 'package:lamp_app_01/src/pages/log_in.dart';
import 'package:lamp_app_01/src/pages/test_page.dart';
import 'package:lamp_app_01/src/theme/tema.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: miTema,
      title: 'Lamp App',
      debugShowCheckedModeBanner: false,
      initialRoute: LogInPage.routeName,
      routes: {
        HomePage.routeName  : (BuildContext context) => HomePage(),
        LogInPage.routeName : (BuildContext context) => LogInPage(), 
        TestPage.routeName  : (BuildContext context) => TestPage(),
      },
    );
  }
}