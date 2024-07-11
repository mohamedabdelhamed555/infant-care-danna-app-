import 'package:flutter/material.dart';
import 'package:graduation/widget/video/call_screen.dart';
import 'package:nanoid/nanoid.dart';

class JoinCall extends StatefulWidget {
  const JoinCall({super.key});

  @override
  State<JoinCall> createState() => _JoinCallState();
}

class _JoinCallState extends State<JoinCall> {
  final callIDController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.12,
                ),
                Image.asset(
                  "assets/images/doctor consultation.jpg",
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.02,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LET'S ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'TALK',
                      style: TextStyle(
                          color: Color(0xff32AA90),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Text(
                  'CONNECT TO THE DOCTOR',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.25,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'User Name',
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                TextFormField(
                  controller: callIDController,
                  decoration: const InputDecoration(
                    labelText: "Enter call id ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.13,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CallScreen(
                                  callID: callIDController.text,
                                  userID: nanoid(),
                                  username: usernameController.text),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF32AA90),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Join',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
