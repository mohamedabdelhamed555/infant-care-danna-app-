// ignore_for_file: avoid_print, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation/screens/home/home_screen.dart';
import 'package:graduation/screens/log/sign_in_phone/verify_otp_screen.dart';

class PhoneAuthController {
  static final _auth = FirebaseAuth.instance;
  static final _googleSignIn = GoogleSignIn();

  static Future<void> sendOtp(BuildContext context, String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Invalid Phone Number"),
                ),
              );
          } else if (error.code == 'too-many-requests') {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Too Many Requests"),
                ),
              );
          } else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text("Something Went Wrong"),
                ),
              );
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => VerifyOtpScreen(
                phoneNumber: phoneNumber,
                verificationId: verificationId,
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseException catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message ?? "Something Went Wrong"),
          ),
        );
    } catch (e) {}
  }

  static Future<void> verifyOtp(
      BuildContext context, String verificationId, String smsCode) async {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      if (!context.mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeScreen(),
        ),
      );
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message ??
                "Something Went Wrong When Verifing Phone Number"),
          ),
        );
    } catch (e) {}
  }

  static Future<void> signOut() async {
    try {
      // Sign out from Firebase
      await _auth.signOut();
      // Sign out from Google if the user is signed in
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      print('Sign out successful.');
    } catch (e) {
      print('Sign out failed: $e');
      throw PlatformException(
          code: 'SIGN_OUT_FAILED', message: 'Failed to sign out.');
    }
  }
}
