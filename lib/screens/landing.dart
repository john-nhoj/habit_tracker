import 'package:flutter/material.dart';
import 'package:habit_tracker/controllers/navigation.dart';
import 'package:habit_tracker/models/routes.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  static final _navigation = Navigation();
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
                _navigation.navigateTo(context, RouteNames.REGISTER);
              },
            ),
            RaisedButton(
              child: Text('Log in'),
              onPressed: () {
                _navigation.navigateTo(context, RouteNames.LOGIN);
              },
            )
          ],
        )));
  }
}
