import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  final List<Map<String, String>> appointments;

  AppointmentPage({required this.appointments});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  void _cancelAppointment(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Cancellation',
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to cancel this appointment?',
            style: TextStyle(color: Colors.grey[700]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.blue[800]),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.appointments.removeAt(index); // Remove the appointment
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.blue[800]),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Appointments',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: widget.appointments.isEmpty
            ? Center(
                child: Text(
                  'No appointments scheduled.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: widget.appointments.length,
                itemBuilder: (context, index) {
                  final appointment = widget.appointments[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 3,
                    color: Colors.blue[50],
                    child: ListTile(
                      title: Text(
                        appointment['doctor']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      subtitle: Text(
                        'Date: ${appointment['date']}\nSlot: ${appointment['slot']}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.cancel, color: Colors.red),
                        onPressed: () {
                          _cancelAppointment(index); // Handle cancellation
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
