import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/models/doctor_model.dart';
import 'package:graduation/screens/doctors/doctor_datails.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctor});
  final DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DoctorDetails(
                    docName: doctor.docName,
                    docImage: doctor.docImage,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.94,
          height: MediaQuery.sizeOf(context).height * 0.18,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: -2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(
                doctor.docImage,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.docName,
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      doctor.docSpecialty,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 14,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${doctor.docPrice} E£',
                          style: const TextStyle(
                            color: Color(0xff32AA90),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.23,
                        ),
                        SizedBox(
                          width: 87,
                          height: 31,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xff32aa90),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorDetails(
                                          docName: doctor.docName,
                                          docImage: doctor.docImage,
                                        )),
                              );
                            },
                            child: Text("Book Now",
                                style: GoogleFonts.amaranth(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
