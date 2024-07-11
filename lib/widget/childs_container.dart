import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/screens/log/child_profile.dart';

class ChildContainer extends StatefulWidget {
  const ChildContainer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChildContainerState createState() => _ChildContainerState();
}

class _ChildContainerState extends State<ChildContainer> {
  List<Map<String, String>> children = [];

  void addChild(Map<String, String> child) {
    setState(() {
      children.add(child);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.0814,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  'My Children :',
                  style: GoogleFonts.ptSans(
                    textStyle: const TextStyle(
                      color: Color(0xff32AA90),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              for (var child in children)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xffBAD9FA),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        child['name']!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 14),
                child: TextButton(
                  onPressed: () async {
                    final newChild = await Navigator.push<Map<String, String>>(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ChildProfile(),
                      ),
                    );
                    if (newChild != null) {
                      addChild(newChild);
                    }
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color(0xff32AA90),
                    child: Icon(Icons.person_add_alt_1_sharp,
                        color: Colors.white, size: 20),
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
