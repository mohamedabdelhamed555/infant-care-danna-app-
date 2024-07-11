import 'package:flutter/material.dart';

class ChildProfile extends StatefulWidget {
  const ChildProfile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChildProfileState createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _childNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _birthWeightController = TextEditingController();
  final TextEditingController _pregnancyPeriodController =
      TextEditingController();
  final TextEditingController _currentWeightController =
      TextEditingController();
  final TextEditingController _currentHeightController =
      TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _lastCheckupDateController =
      TextEditingController();
  final TextEditingController _doctorNotesController = TextEditingController();
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light().copyWith(
                  primary: const Color(0xFF32AA90),
                ),
              ),
              child: child!,
            );
          },
        ) ??
        DateTime.now();
    setState(() {
      controller.text = "${pickedDate.toLocal()}".split(' ')[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add child"),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10, right: 60),
                child: Text(
                  "Details about your child",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _childNameController,
                decoration: const InputDecoration(
                  labelText: 'Child Name',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the child\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _dateOfBirthController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () =>
                        _selectDate(context, _dateOfBirthController),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date of birth';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              DropdownButtonFormField<String>(
                value: 'Male',
                items: ['Male', 'Female']
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _motherNameController,
                decoration: const InputDecoration(
                  labelText: 'Mother\'s Name',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the mother\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _birthWeightController,
                decoration: const InputDecoration(
                  labelText: 'Birth Weight',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the birth weight';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _pregnancyPeriodController,
                decoration: const InputDecoration(
                  labelText: 'Pregnancy Period (weeks)',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the pregnancy period';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _currentWeightController,
                decoration: const InputDecoration(
                  labelText: 'Current Weight',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the current weight';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _currentHeightController,
                decoration: const InputDecoration(
                  labelText: 'Current Height',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the current height';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _bloodTypeController,
                decoration: const InputDecoration(
                  labelText: 'Blood Type',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the blood type';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _lastCheckupDateController,
                decoration: InputDecoration(
                  labelText: 'Last Checkup Date',
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () =>
                        _selectDate(context, _lastCheckupDateController),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the last checkup date';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextFormField(
                controller: _doctorNotesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Doctor\'s Notes',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF32AA90), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, String> newChild = {
                      'name': _childNameController.text,
                      'dateOfBirth': _dateOfBirthController.text,
                      'gender': 'Male', // Replace with actual gender value
                      'motherName': _motherNameController.text,
                      'birthWeight': _birthWeightController.text,
                      'pregnancyPeriod': _pregnancyPeriodController.text,
                      'currentWeight': _currentWeightController.text,
                      'currentHeight': _currentHeightController.text,
                      'bloodType': _bloodTypeController.text,
                      'lastCheckupDate': _lastCheckupDateController.text,
                      'doctorNotes': _doctorNotesController.text,
                    };

                    Navigator.pop(context, newChild);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
