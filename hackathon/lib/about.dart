import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        // Ensure content is scrollable if necessary
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Contact Information
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Phone: +91 98765 43210', // Imaginary Indian Phone Number
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue[800],
                      ),
                    ),
                    Text(
                      'Email: careconnect@service.com', // Imaginary email address
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
              ),

              // Image and Text Description (50% Image, 50% Text)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left: Image
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'assets/aboutus2.jpg', // Replace with your actual image URL
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Right: Text with Description
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to CareConnect',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'We provide healthcare services to your doorstep, including: \n\n'
                            '- Caretakers for elderly\n'
                            '- Maid services\n'
                            '- Medicine delivery\n'
                            '- Doctor appointments\n'
                            '- Wearable technology integration for health monitoring\n\n'
                            'Our goal is to bring the best of healthcare services, with convenience, to ensure the well-being of our clients.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Address Information
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text(
                      'Our Address',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'CareConnect Pvt. Ltd.\n'
                      '123, Main Street, Sector 12\n'
                      'Bangalore, Karnataka - 560001\n'
                      'India',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
