import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/models/sura_data.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];

  Text enText(String text, int fontSize) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(
        fontSize: fontSize.toDouble(),
        fontWeight: FontWeight.w500,
        color: AppColors.prime,
      ),
      textDirection: TextDirection.ltr,
    );
  }

  Widget arText(String text, int fontSize) {
    return Text(
      text,
      style: GoogleFonts.ibmPlexSansArabic(
        fontSize: fontSize.toDouble(),
        fontWeight: FontWeight.w500,
        color: AppColors.prime,
      ),
      textDirection: TextDirection.rtl,
    );
  }

  @override
  Widget build(BuildContext context) {
    SuraData suraData = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (verses.isEmpty) {
      readFile(suraData.number);
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.prime),
        title: Text(
          suraData.enName,
          style: GoogleFonts.aBeeZee(
            color: AppColors.prime,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/img/quran details/left.png'),
                arText(suraData.arName, 24),
                Image.asset('assets/img/quran details/right.png'),
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Text.rich(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                  TextSpan(
                    children:
                        verses.map((text) {
                          int index = verses.indexOf(text);
                          return TextSpan(
                            text: '$text [${index + 1}] ',
                            style: GoogleFonts.ibmPlexSansArabic(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: AppColors.prime,
                              height: 2,
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void readFile(String id) async {
    String data = await rootBundle.loadString('assets/suras/$id.txt');

    List<String> lines = data.split('\n').map((line) => line.trim()).toList();

    // Remove empty lines from the end
    while (lines.isNotEmpty && lines.last.isEmpty) {
      lines.removeLast();
    }

    verses = lines;

    setState(() {});
  }
}

/*
child: ListView.builder(
                itemCount: verses.length,
                itemBuilder: (context, index) {
                  return arText('${verses[index]}[${index + 1}]', 20);
                },
              ),
 */
