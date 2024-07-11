import 'package:flutter/material.dart';
import 'package:graduation/models/doctor_model.dart';
import 'package:graduation/widget/doctors/doctor_card.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({
    super.key,
  });
  final List<DoctorModel> doctors = const [
    DoctorModel(
        docImage: "assets/images/doctorpreview.png",
        docName: "Dr Ahmed Mohsen",
        docSpecialty: "docSpecialty",
        docPrice: "230"),
    DoctorModel(
        docImage: "assets/images/doc.png",
        docName: "Dr Alaa Mohsen",
        docSpecialty: "docSpecialty",
        docPrice: "430"),
    DoctorModel(
        docImage: "assets/images/docimage-.png",
        docName: "Dr Shahd Mohamed",
        docSpecialty: "docSpecialty",
        docPrice: "110"),
    DoctorModel(
        docImage: "assets/images/doc.png",
        docName: "Dr Mohamed Ahmed",
        docSpecialty: "docSpecialty",
        docPrice: "250"),
    DoctorModel(
        docImage: "assets/images/doctorpreview.png",
        docName: "Dr Omar Elsaid",
        docSpecialty: "docSpecialty",
        docPrice: "310"),
    DoctorModel(
        docImage: "assets/images/docimage-.png",
        docName: "Dr Sherook Mohsen",
        docSpecialty: "docSpecialty",
        docPrice: "290"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorCard(
            doctor: doctors[index],
          );
        });
  }
}
