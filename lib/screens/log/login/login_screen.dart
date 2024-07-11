// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:graduation/widget/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation/screens/home/home_screen.dart';
import 'package:graduation/screens/log/sign_in_google/sign_in_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  late SharedPreferences _prefs;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Retrieve saved email and password (if any)
    String? savedEmail = _prefs.getString('email');
    String? savedPassword = _prefs.getString('password');
    if (savedEmail != null) {
      email.text = savedEmail;
    }
    if (savedPassword != null) {
      _passwordController.text = savedPassword;
    }
  }

  Future<void> _loginUser(String email, String password) async {
    try {
      // Save email and password in SharedPreferences
      await _prefs.setString('email', email);
      await _prefs.setString('password', password);

      // Example using Firebase Authentication for login
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuthException
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Authentication failed')),
      );
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Failed to login. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.07,
            ),
            Text(
              "Welcome Back!",
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff32AA90),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "login to access your account",
              textAlign: TextAlign.center,
              style: GoogleFonts.amaranth(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3E63B0),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                // errorBorder: ,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xff32AA90), width: 2),
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
            const SizedBox(height: 20),
            TextFormField(
              obscureText: _obscureText,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
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
                  borderSide:
                      const BorderSide(color: Color(0xff32AA90), width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffb5c3e0)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Implement forget password functionality
                  },
                  child: Text(
                    "Forget Password?",
                    style: GoogleFonts.amaranth(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff32AA90)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _loginUser(email.text, _passwordController.text);
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
                "Login",
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account ?",
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
                        builder: (BuildContext context) => const SignInScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up Here",
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
          ],
        ),
      ),
    );
  }
}
