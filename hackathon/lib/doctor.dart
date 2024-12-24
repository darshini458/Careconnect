import 'package:flutter/material.dart';
import 'schedule.dart'; // Import the schedule page

class DoctorPage extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Dr. Anjali Mehta',
      'age': '45',
      'experience': '20 years',
      'address': 'Bengaluru, Karnataka',
      'qualification': 'MBBS, MD (Cardiology)',
      'bio':
          'A compassionate cardiologist with over two decades of experience in treating heart-related ailments.',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Dr. Rajesh Kumar',
      'age': '50',
      'experience': '25 years',
      'address': 'Mumbai, Maharashtra',
      'qualification': 'MBBS, MS (Orthopedics)',
      'bio':
          'Expert orthopedic surgeon specializing in joint replacements and sports injuries.',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Dr. Sneha Roy',
      'age': '38',
      'experience': '12 years',
      'address': 'Kolkata, West Bengal',
      'qualification': 'MBBS, DGO (Gynecology)',
      'bio':
          'Dedicated gynecologist focusing on women’s health and maternity care.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: doctors.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SchedulePage(doctor: doctor),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: Colors.blue[50],
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(doctor['image']!),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor['name']!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                            ),
                            Text(
                              'Age: ${doctor['age']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              'Experience: ${doctor['experience']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
