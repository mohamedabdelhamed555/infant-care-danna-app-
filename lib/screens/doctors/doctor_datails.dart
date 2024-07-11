import 'package:flutter/material.dart';
import 'package:graduation/widget/doctors/card_in_about_doctor.dart';
import 'package:graduation/widget/doctors/confirm_screen.dart';

class DoctorDetails extends StatefulWidget {
  final String docName;
  final String docImage;
  const DoctorDetails(
      {super.key, required this.docName, required this.docImage});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFavorite = false;
  int? selectedDateIndex;
  int? selectedTimeIndex;
  final List<String> dates = List.generate(8, (index) => "${index + 7} July");
  final List<String> times = List.generate(8, (index) => "${index + 4}:00 PM");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doctor Details",
        ),
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff32AA90),
          ),
          child: Center(
            child: IconButton(
              padding: const EdgeInsets.only(left: 12, right: 10),
              iconSize: 20,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.pinkAccent : Colors.pinkAccent,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 65,
                  backgroundImage: AssetImage(widget.docImage),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                widget.docName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              const Row(
                children: [
                  ThreeCustomCards(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Booking Date",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.25,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedDateIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 25),
                          decoration: BoxDecoration(
                              color: selectedDateIndex == index
                                  ? const Color(0xff32AA90)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dates[index].split(' ')[0],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: selectedDateIndex == index
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                dates[index].split(' ')[1],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: selectedDateIndex == index
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Booking Time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.03,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.17,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: times.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTimeIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 25),
                          decoration: BoxDecoration(
                              color: selectedTimeIndex == index
                                  ? const Color(0xff32AA90)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                times[index],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: selectedTimeIndex == index
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.13,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedDateIndex != null &&
                        selectedTimeIndex != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmScreen(
                            selectedDate: dates[selectedDateIndex!],
                            selectedTime: times[selectedTimeIndex!],
                          ),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Selection Required"),
                            content:
                                const Text("Please select a date and time."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "OK",
                                  style: TextStyle(color: Color(0xFF32AA90)),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff32AA90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
