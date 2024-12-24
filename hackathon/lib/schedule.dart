import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'appointment.dart'; // Import the appointment page

class SchedulePage extends StatefulWidget {
  final Map<String, String> doctor;

  SchedulePage({required this.doctor});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime? selectedDate;
  String? selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor's profile
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3,
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(widget.doctor['image']!),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.doctor['name']!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                            ),
                            Text(
                              widget.doctor['qualification']!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '${widget.doctor['experience']} experience',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              widget.doctor['address']!,
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
              SizedBox(height: 20),

              // Calendar Section
              Text(
                'Select a Date:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 3,
                color: Colors.blue[50],
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(Duration(days: 30)),
                  focusedDay: DateTime.now(),
                  selectedDayPredicate: (day) => isSameDay(selectedDate, day),
                  onDaySelected: (day, focusedDay) {
                    setState(() {
                      selectedDate = day;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue[300],
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue[800],
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(color: Colors.blue[700]),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Slots Section
              Text(
                'Available Slots:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 12,
                children: ['10:00 AM', '11:30 AM', '02:00 PM', '04:00 PM']
                    .map((slot) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSlot = slot;
                            });
                          },
                          child: Chip(
                            label: Text(
                              slot,
                              style: TextStyle(
                                color: selectedSlot == slot
                                    ? Colors.white
                                    : Colors.blue[800],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: selectedSlot == slot
                                ? Colors.blue[800]
                                : Colors.blue[50],
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),

              // Book Appointment Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: selectedDate != null && selectedSlot != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentPage(
                                appointments: [
                                  {
                                    'date': selectedDate.toString(),
                                    'slot': selectedSlot!,
                                    'doctor': widget.doctor['name']!,
                                  }
                                ],
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
