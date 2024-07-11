import 'package:flutter/material.dart';
import 'package:graduation/models/hospital_card_model.dart';
import 'package:graduation/widget/hospital/hospital_card.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({
    super.key,
  });
  final List<HospitalModel> hospitals = const [
    HospitalModel(
        name: "Aman Pediatric Center",
        imageUrl:
            "https://res.cloudinary.com/dphiqvdcz/image/upload/v1720132691/dannaApp/user/cbl8vubhjyndaw9eu0os.png",
        address: "H7P7+2FV, Ismailia, Ismailia Governorate 8356522",
        numOfIncubations: 1,
        price: 1000,
        codeOfIncubations: 12458),
    HospitalModel(
        name: "Ismailia Medical Center Hospital",
        imageUrl:
            "https://res.cloudinary.com/dphiqvdcz/image/upload/v1720112448/dannaApp/user/br3p98pbetde2n6wptxo.jpg",
        address:
            "الإسماعيلية، الشيخ زايد، ثالث الإسماعيلية،, El Sheikh Zayed, 8367004, Egypt",
        numOfIncubations: 2,
        price: 1100,
        codeOfIncubations: 18975),
    HospitalModel(
        name: "Al khair We Al baraka Hospital",
        imageUrl:
            "https://images.healtheg.com//Images/53639/19956217_1939712282709476_3455924169401228335_o5533feb9-d7a3-4318-97e0-acaaaeeccc46.jpg",
        address:
            "Al Kheir WA Al Baraka, El Sheikh Zayed, Ismailia 2, Ismailia Governorate 8363645, Egypt",
        numOfIncubations: 3,
        price: 900,
        codeOfIncubations: 54675),
    HospitalModel(
        name: "Ismailia Military Hospital",
        imageUrl: "https://img.youm7.com/large/202308300133363336.jpg",
        address: "H7M2+RR7, Ismailia 1, Ismailia Governorate 8338221, Egypt",
        numOfIncubations: 3,
        price: 1300,
        codeOfIncubations: 97175),
    HospitalModel(
        name: "Electricity Hospital",
        imageUrl: "https://eehc.gov.eg/msc/images/elec_hos.jpg",
        address:
            "J72G+HPM, El Sheikh Zayed, Ismailia, Ismailia Governorate 8364115, Egypt",
        numOfIncubations: 5,
        price: 1600,
        codeOfIncubations: 88775),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          return HospitalCard(
            hospital: hospitals[index],
          );
        });
  }
}
