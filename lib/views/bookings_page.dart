import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingsPage extends StatefulWidget {
  final List<String> places; // New parameter

  const BookingsPage({super.key, required this.places}); // Updated constructor

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<String, bool> _selectedServices = {
    'Haircut': false,
    'Shave': false,
    'Manicure': false,
    'Pedicure': false,
    'Facial': false,
    'Massage': false,
  };
  String? _selectedTimeSlot;
  String? _selectedPlace; // New state variable for selected place

  @override
  void initState() {
    super.initState();
    if (widget.places.isNotEmpty) {
      _selectedPlace = widget.places.first; // Set initial selected place
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an Appointment'),
        backgroundColor: Colors.orange[800],
        foregroundColor: Colors.white, // Ensure title is visible
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Place',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildPlaceSelection(), // New place selection widget
              const SizedBox(height: 24),
              const Text(
                'Select Date',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildCalendar(),
              const SizedBox(height: 24),
              const Text(
                'Select Time Slot',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildTimeSlots(),
              const SizedBox(height: 24),
              const Text(
                'Select Services',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildServiceSelection(),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle booking confirmation
                    final selectedServicesList = _selectedServices.entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .toList();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Booking Confirmed for $_selectedDay at $_selectedTimeSlot in $_selectedPlace for services: ${selectedServicesList.join(', ')}',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Confirm Booking'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceSelection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          hint: const Text('Choose a place'),
          value: _selectedPlace,
          items: widget.places.map((String place) {
            return DropdownMenuItem<String>(
              value: place,
              child: Text(place),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedPlace = newValue;
            });
          },
          style: const TextStyle(fontSize: 16, color: Colors.black),
          icon: Icon(Icons.arrow_drop_down, color: Colors.orange[800]),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: Colors.orange[800],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.orange[800]),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.orange[800],
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: Colors.orange[200],
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.orange[800],
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(color: Colors.white),
          rangeHighlightColor: Colors.orange.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buildTimeSlots() {
    final List<String> timeSlots = [
      '9:00 AM',
      '10:00 AM',
      '11:00 AM',
      '12:00 PM',
      '1:00 PM',
      '2:00 PM',
      '3:00 PM',
      '4:00 PM',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        final String slot = timeSlots[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTimeSlot = slot;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: _selectedTimeSlot == slot
                  ? Colors.orange[800]
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Center(
              child: Text(
                slot,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _selectedTimeSlot == slot
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildServiceSelection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: _selectedServices.keys.map((serviceName) {
          return CheckboxListTile(
            title: Text(serviceName),
            value: _selectedServices[serviceName],
            onChanged: (bool? value) {
              setState(() {
                _selectedServices[serviceName] = value!;
              });
            },
            activeColor: Colors.orange[800],
            checkColor: Colors.white,
          );
        }).toList(),
      ),
    );
  }
}
