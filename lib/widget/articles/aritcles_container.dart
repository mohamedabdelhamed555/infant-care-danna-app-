import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      height: 127,
      decoration: const BoxDecoration(
          // ignore: use_full_hex_values_for_flutter_colors
          color: Color(0xfffbad9fa),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have you heard ",
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Text(
                "about danna's courses",
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Text(
                "on your child's health?",
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                  width: 111,
                  height: 29,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Text("Find out now",
                        style: GoogleFonts.amaranth(
                          textStyle: const TextStyle(
                              color: Color(0xff3E63B0),
                              fontWeight: FontWeight.w700,
                              fontSize: 12),
                        )),
                  ),
                ),
              )
            ],
          ),
          Image.asset(
            "assets/images/Robot.png",
          )
        ],
      ),
    );
  }
}
