import 'package:flutter/material.dart';
import 'package:graduation/widget/hospital/hospital_list.dart';

class HospitalScreen2 extends StatelessWidget {
  const HospitalScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff32AA90),
          title: const Center(
              child: Text(
            "Suggested hospitals",
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: const HospitalList());
  }
}
