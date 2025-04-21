import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/constant/hadeth.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeth hadethData = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.prime),
        title: Text(
          hadethData.title,
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: AppColors.prime,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/img/quran details/left.png'),
                Expanded(
                  child: Text(
                    hadethData.title,
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.prime,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset('assets/img/quran details/right.png'),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  hadethData.body,
                  style: GoogleFonts.ibmPlexSansArabic(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.prime,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
