import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, RouteNames.homeScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/splash images/png/splash_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: FadeInDown(
                    child: Image.asset(
                      'assets/img/splash images/png/Mosque top.png',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          FadeInLeft(
                            child: Image.asset(
                              'assets/img/splash images/png/left splash.png',
                            ),
                          ),
                        ],
                      ),
                    ),

                    Center(
                      child: FadeIn(child: Image.asset(
                        'assets/img/splash images/png/splash middle icon.png',
                      ),),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FadeInRight(
                            child: Image.asset(
                              'assets/img/splash images/png/right splash.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FadeInUp(child: Image.asset(
                  'assets/img/splash images/png/branding img.png',
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
