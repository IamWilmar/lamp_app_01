import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  static final String routeName = 'logIn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LogInContent(),
        ),
      ),
    );
  }
}

class LogInContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 12.0),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: TextField(
                decoration: InputDecoration(
                hintText: "username",
                border: InputBorder.none,
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                contentPadding: EdgeInsets.only(left:10.0),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.symmetric(vertical: 12.0),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "password",
                border: InputBorder.none,
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                contentPadding: EdgeInsets.only(left:10.0),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}
