import 'package:flutter/material.dart';
import 'package:graduation/controllers/phone_controller.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen(
      {super.key, required this.phoneNumber, required this.verificationId});

  final String phoneNumber;
  final String verificationId;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      textStyle: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(169, 178, 185, 1),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );

    final focusPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.phoneNumber,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Image.asset("assets/images/OTP.png"),
            const Text(
              "To complete your phone number verification, please enter the 6 digit code that send to your number ...",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusPinTheme,
              submittedPinTheme: submittedPinTheme,
              onCompleted: (value) {
                PhoneAuthController.verifyOtp(
                    context, widget.verificationId, value);
              },
            )
          ],
        ),
      )),
    );
  }
}
