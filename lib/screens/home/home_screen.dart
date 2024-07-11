import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/models/doctor_model.dart';
import 'package:graduation/screens/articles/articles_screen.dart';
import 'package:graduation/screens/doctors/top_daoctor.dart';
import 'package:graduation/widget/appbar.dart';
import 'package:graduation/widget/chat_bot.dart';
import 'package:graduation/widget/doctors/doctor_card.dart';
import 'package:graduation/widget/drawer.dart';
import 'package:graduation/widget/home/service_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DoctorModel> doctors = [
      const DoctorModel(
          docImage: "assets/images/doctorpreview.png",
          docName: "Dr Ahmed Mohsen",
          docSpecialty: "docSpecialty",
          docPrice: "230"),
      const DoctorModel(
          docImage: "assets/images/doc.png",
          docName: "Dr Alaa Mohsen",
          docSpecialty: "docSpecialty",
          docPrice: "430"),
      const DoctorModel(
          docImage: "assets/images/doctorpreview.png",
          docName: "Dr Ahmed Mohsen",
          docSpecialty: "docSpecialty",
          docPrice: "110"),
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        icon: Icons.more_vert,
      ),
      drawer: const AllDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xfff5faff),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              width: MediaQuery.sizeOf(context).width * 0.91,
              height: 191,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "How are you \nfeeling today?",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff32AA90),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "  Medimentor can help you \n   with any questions",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff979b9d)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: const Color(0xff32aa90),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22))),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const ChatBot(),
                                    ),
                                  );
                                },
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Start a chat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.arrow_circle_right_outlined,
                                      size: 20,
                                    ),
                                  ],
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/Robot.png",
                    width: MediaQuery.sizeOf(context).width * 0.459,
                    height: MediaQuery.sizeOf(context).height * 0.98,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 6),
              child: Text(
                "Pick your service",
                style: GoogleFonts.adamina(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
              ),
            ),
            ServiceGrid(),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctors",
                    style: GoogleFonts.adamina(
                      textStyle: const TextStyle(
                          color: Color(0xff919191),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const TopDoctor(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: GoogleFonts.amaranth(
                        textStyle: const TextStyle(
                          color: Color(0xff37ac93),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return DoctorCard(doctor: doctors[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Articles",
                    style: GoogleFonts.adamina(
                      textStyle: const TextStyle(
                          color: Color(0xff919191),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ArticleScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: GoogleFonts.amaranth(
                        textStyle: const TextStyle(
                          color: Color(0xff37ac93),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/Frame 24.png",
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: MediaQuery.sizeOf(context).height * 0.131,
                  ),
                  Image.asset(
                    "assets/images/article2.jpg",
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: MediaQuery.sizeOf(context).height * 0.131,
                  ),
                  Image.asset(
                    "assets/images/article3.jpg",
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: MediaQuery.sizeOf(context).height * 0.131,
                  ),
                  Image.asset(
                    "assets/images/articles4.jpg",
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: MediaQuery.sizeOf(context).height * 0.131,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
