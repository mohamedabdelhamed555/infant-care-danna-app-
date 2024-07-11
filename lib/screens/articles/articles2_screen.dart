import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/widget/appbar.dart';
import 'package:graduation/widget/drawer.dart';

class Article2Screen extends StatelessWidget {
  final String description;
  final List<String> subTitles;
  final List<String> subDescriptions;
  final String title;
  final String image;
  const Article2Screen({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.subTitles,
    required this.subDescriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        icon: Icons.more_vert,
      ),
      drawer: const AllDrawer(),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                "Medical Articles",
                style: GoogleFonts.ptSans(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff32AA90),
                  ),
                ),
              ),
            ),
          ),
          Image.network(
            image,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12, left: 16),
            child: Text(
              title,
              style: GoogleFonts.amaranth(
                textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12, left: 16),
            child: Text(
              description,
              style: GoogleFonts.amaranth(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff32AA90),
                ),
              ),
            ),
          ),
          for (int i = 0; i < subTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20),
              child: Text(
                subTitles[i],
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff3E63B0),
                  ),
                ),
              ),
            ),
          for (int i = 0; i < subDescriptions.length; i++)
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                subDescriptions[i],
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6D6666),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
