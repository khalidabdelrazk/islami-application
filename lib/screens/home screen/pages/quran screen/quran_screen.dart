import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/constant/quran_helper.dart';
import 'package:islami_app/core/models/sura_data.dart';
import 'package:islami_app/screens/home%20screen/widgets/custom_search_delegate.dart';
import 'package:islami_app/screens/home%20screen/widgets/sura_card.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  Text customText(String text, {dynamic fontSize = 16, Color? color}) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        color: color ?? AppColors.prime,
        fontSize: fontSize.toDouble(),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/home screen/img/quraan.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Image.asset(
                'assets/img/home screen/img/Logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      border: Border.all(width: 1, color: AppColors.prime),
                    ),
                    child: InkWell(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 28,
                            child: SvgPicture.asset(
                              'assets/img/home screen/svg/Vector.svg',
                            ),
                          ),
                          const SizedBox(width: 10),
                          customText('Sura Name'),
                          const Spacer(),
                          Icon(Icons.search_rounded, color: AppColors.prime),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(children: [customText('Suras List')]),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 114,
                    separatorBuilder: (context, index) {
                      return const Divider(indent: 40, endIndent: 40);
                    },
                    itemBuilder: (context, index) {
                      return SuraCard(
                        suraData: SuraData(
                          enName: QuranHelper.englishName[index],
                          arName: QuranHelper.arabicName[index],
                          verses: QuranHelper.verses[index],
                          number: (index + 1).toString(),
                        ),
                      );
                    },
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
