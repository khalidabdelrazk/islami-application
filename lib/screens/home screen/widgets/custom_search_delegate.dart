import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/constant/quran_helper.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = QuranHelper.englishName + QuranHelper.arabicName ;

  // first overwrite to
  // clear the search text

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black, // Transparent AppBar
        elevation: 0, // Remove shadow
        surfaceTintColor: Colors.transparent, // Ensure true transparency
        iconTheme: IconThemeData(color: AppColors.prime), // Icon color
        titleTextStyle: GoogleFonts.aBeeZee(
          color: AppColors.prime,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent, // Transparent search field
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.prime), // Change hint text color
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: AppColors.prime), // Change input text color
      ),
    );
  }


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(
            result,
            style: GoogleFonts.aBeeZee(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.prime,
            ),
          ),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/home screen/img/quraan.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: InkWell(
              onTap: () {

              },
              child: Text(
                result,
                style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.prime,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
