import 'package:flutter/material.dart';
import 'package:habit_tracker/models/routes.dart';
import 'package:habit_tracker/screens/home.dart';
import 'package:habit_tracker/screens/login.dart';
import 'package:habit_tracker/screens/register.dart';

class Navigation {
  static final Navigation _instance = Navigation._internal();
  static final Routes _routes = Routes();

  factory Navigation() {
    return _instance;
  }

  Navigation._internal();

  Object getRoutes() {
    return {
      getRoute(RouteNames.LOGIN): (context) => LoginPage(),
      getRoute(RouteNames.REGISTER): (context) => RegisterPage(),
      getRoute(RouteNames.HOME): (context) => HomePage()
    };
  }

  String getRoute(RouteNames routeName) => _routes.getRoute(routeName);

  void navigateTo(BuildContext context, RouteNames routeName,
      {Object arguments}) {
    Navigator.pushNamed(context, getRoute(routeName), arguments: arguments);
  }

  void resetAndNavigateTo(BuildContext context, RouteNames routeName,
      {Object arguments}) {
    Navigator.pushNamedAndRemoveUntil(
        context, getRoute(routeName), (route) => false);
  }

  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
