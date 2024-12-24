import 'package:flutter/material.dart';
import 'loginorsignup.dart'; // Import Login/Signup page
import 'services.dart';
import 'about.dart';
import 'wearable.dart'; // Import the WearablePage

class WebsitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Welcome to CareConnect',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Top section: Blue banner with icon and title
          Container(
            color: Colors.blue,
            width: double.infinity, // Ensure it takes up full width
            height: 300, // Adjust this height based on your preference
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center content horizontally
              children: [
                Icon(
                  Icons.elderly, // Icon for elderly care
                  size: 100, // Icon size
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  'CareConnect',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Bringing healthcare services, wearables, and assistance to your doorstep.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center, // Center-aligning the text
                ),
                SizedBox(height: 20), // Space between subtitle and login prompt
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white, // Button text color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LoginOrSignupPage(), // Navigate to login/signup page
                      ),
                    );
                  },
                  child: Text(
                    'Login / Register', // Button text
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom section: White content area with options and buttons
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Select an Option',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text in blue section
                      ),
                      textAlign: TextAlign.center, // Center-aligning the text
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildOptionCard(
                            context,
                            'assets/services.jpg', // Replace with your Service image link
                            'Services',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServicesPage(),
                                ),
                              );
                            },
                          ),
                          _buildOptionCard(
                            context,
                            'assets/smartwatch.jpg', // Replace with your Wearable image link
                            'Wearables',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      WearablePage(), // Navigate to WearablePage
                                ),
                              );
                            },
                          ),
                          _buildOptionCard(
                            context,
                            'assets/aboutus.png', // Replace with your About Us image link
                            'About Us',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AboutPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context,
    String imageUrl,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: Colors.blue, // White background for the option card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for the options
                ),
                textAlign: TextAlign
                    .center, // Center-aligning the text inside the card
              ),
            ),
          ],
        ),
      ),
    );
  }
}
