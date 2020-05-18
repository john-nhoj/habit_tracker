import 'package:flutter/material.dart';
import 'package:habit_tracker/models/user.dart';
import 'package:habit_tracker/screens/landing.dart';
import 'package:habit_tracker/screens/register.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          '/register': (context) => RegisterPage(),
        },
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
      ],
    );
  }
}
