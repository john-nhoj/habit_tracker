import 'package:flutter/material.dart';
import 'package:habit_tracker/models/user.dart';
import 'package:habit_tracker/screens/register.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    var userProfile = Provider.of<UserModel>(context, listen: true);
    String text = userProfile.isAuthenticated()
        ? 'Hello ${userProfile.getUsername()}'
        : 'Something went wrong $userProfile';
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
