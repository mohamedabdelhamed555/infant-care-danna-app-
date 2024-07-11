import 'package:flutter/material.dart';
import 'package:graduation/widget/map/current_location.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff32AA90),
          ),
          child: Center(
            child: IconButton(
              padding: const EdgeInsets.only(left: 12, right: 10),
              iconSize: 20,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.15,
            ),
            Image.asset(
              "assets/images/location.jpg",
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            const Text(
              "What is Your Location ?",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.03),
            const Center(
              child: Text(
                "We need to know your location to suggest",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            ),
            const Center(
              child: Text(
                "nearby hospitals.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.13,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const CurrentLocationScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF32AA90),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Allow Location Access',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
