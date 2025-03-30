import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/models/sura_data.dart';

import '../../../core/app_colors.dart';

class SuraCard extends StatelessWidget {
  final SuraData suraData;
  const SuraCard({super.key, required this.suraData});

  Text customText(String text) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text customTextAr(String text) {
    return Text(
      text,
      style: GoogleFonts.ibmPlexSansArabic(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/img/home screen/img/surah num.png'),
                ),
              ),
              child: Center(child: customText(suraData.number)),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(suraData.enName),

                customText('${suraData.verses} verses'),
              ],
            ),
            const Spacer(),
            Center(child: customTextAr(suraData.arName)),
          ],
        ),
      ),
    );
  }
}
