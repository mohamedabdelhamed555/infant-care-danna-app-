// ignore_for_file: unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/controllers/google_controller.dart';
import 'package:graduation/screens/home/home_screen.dart';
import 'package:graduation/screens/log/login/login_screen.dart';
import 'package:graduation/screens/log/sign_in_phone/phone_screen.dart';
import 'package:graduation/widget/drawer.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  RegExp regExp = new RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  String? selectedItem;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/logo.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Join Us Today!",
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff32AA90),
                      ),
                    ),
                  ),
                  Text(
                    "sign up now to become a member",
                    style: GoogleFonts.amaranth(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3E63B0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: MediaQuery.sizeOf(context).height * 0.73,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextFormField(
                            controller: firstName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("the User name must not be empty");
                              } else if (value.length < 3) {
                                return ("User Name must be graterThan 3 Characters");
                              } else if (value[0].toUpperCase() != value[0]) {
                                return 'First character should be uppercase';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Fist Name",
                              hintStyle: GoogleFonts.amaranth(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff32AA90), width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffb5c3e0)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: lastName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("the User name must not be empty");
                              } else if (value.length < 3) {
                                return ("User Name must be graterThan 3 Characters");
                              } else if (value[0].toUpperCase() != value[0]) {
                                return 'First character should be uppercase';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              hintStyle: GoogleFonts.amaranth(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff32AA90), width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffb5c3e0)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an email';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Email Address",
                              hintStyle: GoogleFonts.amaranth(
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff32AA90), width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xffb5c3e0),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: _obscureText,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              } else {
                                if (!regex.hasMatch(value)) {
                                  return 'The password must contain ("A / a / 0:9/ @#%^&*")';
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              hintText: "Password",
                              hintStyle: GoogleFonts.amaranth(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff32AA90), width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xffb5c3e0)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Future<void> registerUser(
                                  String email, String password) async {
                                try {
                                  UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                  // User successfully registered
                                  if (userCredential.user != null) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                    );
                                  }
                                } on FirebaseAuthException catch (e) {
                                  // Handle error
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(e.message ??
                                            'Something went wrong')),
                                  );
                                }
                              }

                              if (_formKey.currentState!.validate()) {
                                registerUser(email.text, password.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                backgroundColor: const Color(0xff32aa90),
                                elevation: 10,
                                minimumSize: const Size(double.infinity, 60)),
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.amaranth(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account ?",
                                style: GoogleFonts.amaranth(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login Now",
                                  style: GoogleFonts.amaranth(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff32aa90),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              try {
                                final user =
                                    await UserController.loginWithGoogle();
                                if (user != null && mounted) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const HomeScreen(),
                                    ),
                                  );
                                }
                              } on FirebaseAuthException catch (error) {
                                print(error.message);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(error.message ??
                                        "something went wrong"),
                                  ),
                                );
                              } catch (error) {
                                print(error);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      error.toString(),
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.white,
                              elevation: 5,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/google_logo-removebg.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                const Text(
                                  "Sign in with Google",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff3E63B0),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const PhoneScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.white,
                              elevation: 5,
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 40,
                                  color: Color(0xff3E63B0),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  "Sign in with Phone",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff3E63B0),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.008,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
