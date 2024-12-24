import 'package:flutter/material.dart';
import 'website.dart'; // Import the WebsitePage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => WebsitePage()), // Change this to WebsitePage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Icon(
          Icons.elderly, // Icon for elderly care
          size: 100,
          color: Colors.white,
        ),
      ),
    );
  }
}
