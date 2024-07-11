import 'package:flutter/material.dart';
import 'package:graduation/screens/doctors/doctor_list_view.dart';

class TopDoctor extends StatelessWidget {
  const TopDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff32AA90),
          title: const Center(
              child: Text(
            "Doctors",
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: const DoctorListView());
  }
}
