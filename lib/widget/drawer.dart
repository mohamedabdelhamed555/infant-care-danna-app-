// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/Global/drawer.dart';
import 'package:graduation/controllers/google_controller.dart';
import 'package:graduation/screens/log/login/login_screen.dart';
import 'package:graduation/screens/log/profile.dart';

class AllDrawer extends StatefulWidget {
  const AllDrawer({Key? key}) : super(key: key);

  @override
  State<AllDrawer> createState() => _AllDrawerState();

  static void updateProfileImage(File? newImage) {
    if (_AllDrawerState.mountedDrawerState != null) {
      _AllDrawerState.mountedDrawerState!(() {
        _AllDrawerState._profileImage = newImage;
      });
    }
  }
}

class _AllDrawerState extends State<AllDrawer> {
  static File? _profileImage;

  static void Function(void Function())? mountedDrawerState;

  @override
  void initState() {
    super.initState();
    mountedDrawerState = setState;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 45,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff32AA90),
              ),
              child: Container(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : NetworkImage(
                            UserController.user?.photoURL ??
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Google_Photos_icon_%282020%29.svg/640px-Google_Photos_icon_%282020%29.svg.png",
                          ) as ImageProvider<Object>?,
                    radius: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "Welcome!",
                          style: GoogleFonts.amaranth(
                            textStyle: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Text(
                        "${firstName.text} ${lastName.text}",
                        style: GoogleFonts.amaranth(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 32,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xffB8B4B4),
                              width: 1,
                            ),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const ProfileScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "View and edit your profile",
                            style: GoogleFonts.amaranth(
                              textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffB8B4B4)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: texts.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(
                  icons[index],
                  color: iconColors[index],
                ),
                title: Text(texts[index]),
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, '/saved');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/help');
                      break;
                    case 2:
                      Navigator.pushNamed(context, '/booking');
                      break;
                    case 3:
                      Navigator.pushNamed(context, '/favorites');
                      break;
                    case 4:
                      Navigator.pushNamed(context, '/video');
                      break;
                    case 5:
                      Navigator.pushNamed(context, '/notification');
                      break;
                    case 6:
                      Navigator.pushNamed(context, '/settings');
                      break;
                    default:
                      break;
                  }
                },
              );
            },
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
              margin: const EdgeInsets.symmetric(vertical: 8),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color(0xff1976d2),
            ),
            title: const Text('Log Out'),
            onTap: () async {
              try {
                await UserController.signOut();
                // await PhoneAuthController.signOut();
                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text('Failed to sign out: $e'),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}

TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController phone = TextEditingController();
