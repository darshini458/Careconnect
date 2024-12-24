import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'otp.dart'; // Import the OTP page

// SignIn Page
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String? _selectedAgeGroup;
  List<String> _services = [
    "Medicine Delivery",
    "Doctor Appointments",
    "Wearable Technology"
  ];
  List<String> _selectedServices = [];

  // GPS location
  String _location = 'Unknown';

  // Get current location (this is just an example)
  Future<void> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _location = 'Lat: ${position.latitude}, Long: ${position.longitude}';
      _locationController.text = _location;
    });
  }

  @override
  void initState() {
    super.initState();
    _getLocation(); // Fetch the location on page load
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  // Function to format the phone number with +91 and space between code and number
  String formatPhoneNumber(String number) {
    if (number.isNotEmpty && !number.startsWith('+91')) {
      return '+91 $number';
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Username field
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Phone number field
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number (Enter without country code)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      // Automatically prepend +91 and add a space when the phone number changes
                      _phoneController.text = formatPhoneNumber(value);
                      _phoneController.selection = TextSelection.fromPosition(
                          TextPosition(offset: _phoneController.text.length));
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\+91 \d{10}$').hasMatch(value)) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Age group dropdown
                DropdownButtonFormField<String>(
                  value: _selectedAgeGroup,
                  decoration: InputDecoration(
                    labelText: 'Age Group',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    '55-60',
                    '61-65',
                    '66-70',
                    '71-75',
                    '76-80',
                    '81-85',
                    '86-90',
                    '90+'
                  ].map((String ageGroup) {
                    return DropdownMenuItem<String>(
                      value: ageGroup,
                      child: Text(ageGroup),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAgeGroup = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an age group';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Location field (auto-detected)
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Location (Auto-detected)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  enabled: false, // Location is auto-detected, cannot edit
                ),
                SizedBox(height: 16),

                // Line to ask user to choose between services
                Text(
                  'Please select the services you are interested in:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),

                // Interested Services checkboxes
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _services.map((service) {
                    return CheckboxListTile(
                      title: Text(service),
                      value: _selectedServices.contains(service),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedServices.add(service);
                          } else {
                            _selectedServices.remove(service);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),

                // Sign in button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle the sign-in logic here (e.g., OTP navigation)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPPage(),
                        ),
                      ); // Navigate to OTP page
                    }
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
