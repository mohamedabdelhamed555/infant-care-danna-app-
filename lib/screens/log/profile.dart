// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/screens/home/home_screen.dart';
import 'package:graduation/widget/childs_container.dart';
import 'package:graduation/widget/drawer.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  RegExp regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  File? _image;

  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        AllDrawer.updateProfileImage(_image);
        ProfileImageManager.updateProfileImage(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff32aa90),
      drawer: const AllDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Column(
                  children: [
                    _image == null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.grey[700],
                            ),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(_image!),
                          ),
                    TextButton(
                      onPressed: getImage,
                      child: Text(
                        "change profile picture",
                        style: GoogleFonts.ptSans(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const ChildContainer(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.08,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    child: TextFormField(
                      controller: firstName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Fist name must not be empty");
                        } else if (value.length < 3) {
                          return ("Fist Name must be graterThan 3 Characters");
                        } else if (value[0].toUpperCase() != value[0]) {
                          return 'First character should be uppercase';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Fist Name",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        hintText: firstName.text,
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
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    child: TextFormField(
                      controller: lastName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Last name must not be empty");
                        } else if (value.length < 3) {
                          return ("Last Name must be graterThan 3 Characters");
                        } else if (value[0].toUpperCase() != value[0]) {
                          return 'First character should be uppercase';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        hintText: lastName.text,
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
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an email';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "E-Mail",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        hintText: email.text,
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
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    child: TextFormField(
                      controller: phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your number';
                        } else if (value.length < 11) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Phone-Number",
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        hintText: "Phone Number",
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
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomeScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color(0xff32aa90),
                        elevation: 10,
                        minimumSize: const Size(double.infinity, 60)),
                    child: Text(
                      "Save Change",
                      style: GoogleFonts.amaranth(
                        textStyle: const TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileImageManager {
  static File? profileImage;

  static void updateProfileImage(File? newImage) {
    profileImage = newImage;
  }
}
