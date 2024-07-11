import 'package:flutter/material.dart';
import 'package:graduation/screens/home/home_screen.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF0F0F0),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(40),
                child: Image.asset(
                  'assets/images/True.jpg',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              const Text(
                "Payment Successful !",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "You have successfully booked appointment",
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF32AA90),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Go to home',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
