import 'package:flutter/material.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/screens/home%20screen/pages/hadeth%20screen/hadeth_screen.dart';
import 'package:islami_app/screens/home%20screen/pages/pray%20time/pray_time.dart';
import 'package:islami_app/screens/home%20screen/pages/quran%20screen/quran_screen.dart';
import 'package:islami_app/screens/home%20screen/pages/radio_screen/radio_screen.dart';
import 'package:islami_app/screens/home%20screen/pages/sebha%20screen/sebha_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    PrayTime(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          backgroundColor: AppColors.prime,
          type: BottomNavigationBarType.fixed,
          fixedColor: AppColors.white,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fingerprint),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.radio),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_timeline),
              label: 'Pray Time',
            ),
          ],
        ),
      ),
    );
  }
}
