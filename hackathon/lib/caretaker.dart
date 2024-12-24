import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'appointments2.dart'; // Import AppointmentPage

class CaretakerPage extends StatefulWidget {
  @override
  _CaretakerPageState createState() => _CaretakerPageState();
}

class _CaretakerPageState extends State<CaretakerPage> {
  final List<Map<String, String>> caretakers = [
    // List of caretaker profiles
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'John Doe',
      'age': '35',
      'experience': '5 years',
      'address': '123 Maple Street, Springfield',
      'bio':
          'Experienced caretaker with expertise in elderly care and assistance.',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Emma Johnson',
      'age': '29',
      'experience': '3 years',
      'address': '45 Oak Avenue, Riverdale',
      'bio':
          'Compassionate caregiver with a focus on medical support and companionship.',
    },
    // More caretakers here...
  ];

  List<Map<String, String>> appointments = [];

  // List of available time slots
  List<String> availableSlots = [
    "9:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM",
    "1:00 PM - 2:00 PM",
    "2:00 PM - 3:00 PM",
    "3:00 PM - 4:00 PM",
  ];

  // Variables to store selected date and time
  String selectedDate = '';
  String selectedTime = '';

  // Function to open DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = DateFormat('MM/dd/yyyy').format(picked);
      });
    }
  }

  // Function to book an appointment
  void _bookAppointment(Map<String, String> caretaker) {
    if (selectedDate.isEmpty || selectedTime.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please select a date and time first'),
            content: Text(
                'You must choose both a date and time slot to book an appointment.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Navigate to AppointmentPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentPage(
          appointments: [
            {
              'caretaker': caretaker['name']!,
              'date': selectedDate,
              'slot': selectedTime,
            }
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Caretaker Profiles',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: caretakers.length,
          itemBuilder: (context, index) {
            final caretaker = caretakers[index];
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Date Picker Section
                            Text(
                              'Select Appointment Date:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  child: Text(
                                    selectedDate.isEmpty
                                        ? 'Pick a Date'
                                        : selectedDate,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),

                            // Time Slot Selection Section
                            Text(
                              'Available Time Slots:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Column(
                              children: availableSlots.map((slot) {
                                return RadioListTile<String>(
                                  title: Text(slot),
                                  value: slot,
                                  groupValue: selectedTime,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedTime = value!;
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 16),

                            // Book Appointment Button
                            ElevatedButton(
                              onPressed: () {
                                _bookAppointment(caretaker);
                              },
                              child: Text('Book Appointment'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3,
                color: Colors.blue[50],
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(caretaker['image']!),
                  ),
                  title: Text(
                    caretaker['name']!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[800]),
                  ),
                  subtitle: Text(
                    'Age: ${caretaker['age']}\nExperience: ${caretaker['experience']}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  trailing: Icon(Icons.arrow_forward, color: Colors.blue[800]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
