import 'package:flutter/material.dart';
import 'package:habit_tracker/models/routes.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.pushNamed(
                    context, Routes().getRoute(RouteNames.REGISTER));
              },
            ),
            RaisedButton(
              child: Text('Log in'),
              onPressed: () {
                Navigator.pushNamed(
                    context, Routes().getRoute(RouteNames.LOGIN));
              },
            )
          ],
        )));
  }
}
