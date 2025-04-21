import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/constant/hadeth.dart';
import 'package:islami_app/screens/home%20screen/pages/hadeth%20screen/hadeth_card.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<Hadeth> ahadeth = [];

  @override
  void initState() {
    readFile();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.black, AppColors.black],
          begin: Alignment.topCenter,
          end: Alignment.topCenter,
        ),
        image: DecorationImage(
          image: AssetImage('assets/img/home screen/img/mosque.png'),
          alignment: Alignment.topCenter,
          colorFilter: ColorFilter.mode(
            AppColors.black.withOpacity(0.7),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Image.asset(
            'assets/img/home screen/img/Logo.png',
            width: width * 0.8,
          ),
          SizedBox(height: height*0.1,),
          ahadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : CarouselSlider(
            options: CarouselOptions(height: height*0.5),
            items:
            ahadeth.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: width*0.02),
                    child: HadethCard(hadeth: i),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Future<void> readFile() async {
    try {
      String hadeth = await rootBundle.loadString('assets/ahadeth.txt');
      List<String> hadethList = hadeth.split('#');

      for (var e in hadethList) {
        e = e.trim();
        List<String> lines = e.split('\n');

        if (lines.length >= 2) {
          String title = lines[0].trim();
          String body = lines.sublist(1).join('\n').trim(); // Support multi-line body
          ahadeth.add(Hadeth(title: title, body: body));
        }
      }

      setState(() {});
    } catch (e) {
      print('📛 Error reading hadeth file: $e');
    }
  }

}
