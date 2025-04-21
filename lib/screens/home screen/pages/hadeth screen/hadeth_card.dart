import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/constant/hadeth.dart';
import 'package:islami_app/core/routes/route_names.dart';
import 'package:islami_app/screens/home%20screen/pages/quran%20screen/quran_screen.dart';

class HadethCard extends StatelessWidget {
  final Hadeth hadeth;
  const HadethCard({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.hadethDetails,arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: width,
        height: height,
        // clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.prime,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/img/home screen/img/mus7af.png',
                  height: height * 0.4,
                ),
                Image.asset(
                  'assets/img/home screen/img/mosques.png',
                  fit: BoxFit.fitWidth,
                  width: width,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: height * 0.01),
                Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Image.asset('assets/img/home screen/img/left.png'),
                    Expanded(
                      child: Text(
                        hadeth.title,
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset('assets/img/home screen/img/right.png'),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth.body,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Positioned(
            //   child: Image.asset('assets/img/home screen/img/mosques.png',fit: BoxFit.fitWidth,width: width,),
            // ),
            // Positioned(
            //   bottom: 0,
            //   child: Image.asset('assets/img/home screen/img/mus7af.png'),
            // ),
          ],
        ),
      ),
    );
  }
}
