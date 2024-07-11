// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:graduation/controllers/phone_controller.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  bool enableOtpButton = false;
  String phoneNumber = '';

  getOtp() {
    PhoneAuthController.sendOtp(context, phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "enter your Phone Number",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const Text(
                "please we need your phone number to send you an OTP code to join Us ...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              InternationalPhoneNumberInput(
                onInputValidated: (value) {
                  setState(() {
                    print(value);
                    enableOtpButton = value;
                  });
                },
                onInputChanged: (value) {
                  setState(() {
                    phoneNumber = value.phoneNumber!;
                  });
                },
                formatInput: true,
                autoFocus: true,
                selectorConfig: const SelectorConfig(
                    useEmoji: true,
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
                inputDecoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff32aa90)),
                  onPressed: enableOtpButton ? getOtp : null,
                  child: const Text(
                    "Get OTP",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
