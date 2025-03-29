import 'package:flutter/cupertino.dart';
import 'package:islami_app/core/routes/route_names.dart';
import 'package:islami_app/screens/splash%20screen/splash_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.splash: (_) => SplashScreen(),
  };
}
