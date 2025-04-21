import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double rotationAngle = 0.0;

  int currentZikrIndex = 0;
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "لا حول ولا قوة إلا بالله",
    "أستغفر الله",
    "اللهم صل على محمد",
    "سبحان الله وبحمده",
    "سبحان الله العظيم",
  ];

  void onSebhaPressed() {
    rotationAngle += 360 / 30 * pi / 180;
    setState(() {
      counter++;
      if (counter == 33) {
        counter = 0;
        currentZikrIndex = ((currentZikrIndex + 1) % azkar.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/home screen/img/sebha bg.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.black.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.04),
          Image.asset(
            'assets/img/home screen/img/Logo.png',
            width: width * 0.8,
          ),
          SizedBox(height: height * 0.02),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: GoogleFonts.ibmPlexSansArabic(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: height * 0.1,
                    child: Image.asset(
                      'assets/img/home screen/img/sebha head.png',
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.09,
                  child: GestureDetector(
                    onTap: () {
                      onSebhaPressed();
                    },
                    child: Stack(
                      children: [
                        Transform.rotate(
                          angle: rotationAngle,
                          child: SizedBox(
                            height: height * 0.45,
                            width: width,
                            child: Image.asset(
                              'assets/img/home screen/img/sebha body.png',
                            ),
                          ),
                        ),
                        Positioned(
                          top: height * 0.19,
                          left: width / 2.7,
                          child: Column(
                            children: [
                              const Row(),
                              Text(
                                azkar[currentZikrIndex],
                                style: GoogleFonts.ibmPlexSansArabic(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                '$counter',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
