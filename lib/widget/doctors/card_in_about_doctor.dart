import 'package:flutter/material.dart';

class CardInAboutDoc extends StatelessWidget {
  final String lable;
  final IconData icon;
  final Color iconColor;
  final String value;

  const CardInAboutDoc(
      {super.key,
      required this.lable,
      required this.icon,
      required this.iconColor,
      required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.23,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lable,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                value,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ThreeCustomCards extends StatelessWidget {
  const ThreeCustomCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CardInAboutDoc(
          lable: 'Patients',
          icon: Icons.groups,
          iconColor: Color(0xff32AA90),
          value: '1000+',
        ),
        CardInAboutDoc(
          lable: 'Experiences',
          icon: Icons.medical_services,
          iconColor: Colors.blue,
          value: '5 Years',
        ),
        CardInAboutDoc(
          lable: 'Reviews',
          icon: Icons.star,
          iconColor: Colors.orange,
          value: '4.7',
        ),
      ],
    );
  }
}
