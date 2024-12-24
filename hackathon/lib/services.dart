import 'package:flutter/material.dart';
import 'caretaker.dart';
import 'medicine.dart';
import 'doctor.dart';
import 'wearable.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Caretaker',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CaretakerPage()),
                );
              },
            ),
            Divider(), // Divider between items
            ListTile(
              title: Text(
                'Medicine Delivery',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicinePage()),
                );
              },
            ),
            Divider(), // Divider between items
            ListTile(
              title: Text(
                'Doctor Appointments',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorPage()),
                );
              },
            ),
            Divider(), // Divider between items
            ListTile(
              title: Text(
                'Wearable Technology',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WearablePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
