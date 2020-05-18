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
        initialRoute: '/',
        routes: {
          '/': (context) => LandingPage(title: 'Habit Tracker'),
          '/register': (context) => RegisterPage(),
          // '/login': (context) => LogInPage(),
        },
      ),
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
      ],
    );
  }
}
