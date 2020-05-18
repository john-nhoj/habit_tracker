import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/register.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    String text = 'Register me!';
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: Center(
            child: RaisedButton(
          child: Text(text),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPage()));
          },
        )));
  }
}
