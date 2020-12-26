import 'package:flutter/material.dart';
import 'package:lamp_app_01/src/widgets/device_card.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'homePage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF131516),
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, size: 30.0),
            ),
          ],
        ),
        backgroundColor: Color(0xFF131516),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                PageTitle("Welcome back"),
                CardHolder("BEDROOM"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  final TextStyle sceneFont = TextStyle(
      fontSize: 40,
      color: Colors.white,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w600);
  final String sceneName;
  PageTitle(this.sceneName);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Text(sceneName, style: sceneFont),
    );
  }
}
