import 'package:flutter/material.dart';
import 'package:habit_tracker/models/routes.dart';
import 'package:habit_tracker/models/user.dart';
import 'package:habit_tracker/screens/home.dart';
import 'package:habit_tracker/screens/landing.dart';
import 'package:habit_tracker/screens/login.dart';
import 'package:habit_tracker/screens/register.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Routes _routes = Routes();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        title: 'Habit Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingPage(
          title: 'Habit Tracker',
        ),
        routes: {
          _routes.getRoute(RouteNames.LOGIN): (context) => LoginPage(),
          _routes.getRoute(RouteNames.REGISTER): (context) => RegisterPage(),
          _routes.getRoute(RouteNames.HOME): (context) => HomePage()
        },
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
      ],
    );
  }
}
