import 'package:flutter/material.dart';
import 'package:habit_tracker/controllers/navigation.dart';
import 'package:habit_tracker/models/routes.dart';
import 'package:habit_tracker/models/user.dart';
import 'package:habit_tracker/screens/home.dart';
import 'package:habit_tracker/screens/landing.dart';
import 'package:habit_tracker/screens/login.dart';
import 'package:habit_tracker/screens/register.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final Navigation _navigation = Navigation();
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
          _navigation.getRoute(RouteNames.LOGIN): (context) => LoginPage(),
          _navigation.getRoute(RouteNames.REGISTER): (context) =>
              RegisterPage(),
          _navigation.getRoute(RouteNames.HOME): (context) => HomePage()
        },
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
      ],
    );
  }
}
