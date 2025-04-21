import 'package:flutter/cupertino.dart';
import 'package:islami_app/core/routes/route_names.dart';
import 'package:islami_app/screens/hadeth_screen.dart';
import 'package:islami_app/screens/home%20screen/home_screen.dart';
import 'package:islami_app/screens/quran%20details/quran_details.dart';
import 'package:islami_app/screens/splash%20screen/splash_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.splash: (_) => SplashScreen(),
    RouteNames.homeScreen: (_) => HomeScreen(),
    RouteNames.quranDetails: (_) => QuranDetails(),
    RouteNames.hadethDetails: (_) => HadethScreen(),
  };
}
