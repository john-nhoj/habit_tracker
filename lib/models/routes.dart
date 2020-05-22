enum RouteNames { LANDING, HOME, REGISTER, LOGIN }

class Routes {
  static final Routes _instance = Routes._internal();
  static final Map<RouteNames, String> _routes = {
    RouteNames.LANDING: '/',
    RouteNames.HOME: '/home',
    RouteNames.REGISTER: '/register',
    RouteNames.LOGIN: '/login'
  };

  factory Routes() {
    return _instance;
  }

  Routes._internal();

  String getRoute(RouteNames name) => _routes[name];
}
