import 'package:flutter/material.dart';
import 'package:my_booking_app/routes.dart';
import 'package:my_booking_app/widgets/carousel_slider.dart';
import 'package:my_booking_app/widgets/salon_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Find a salon',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Near you',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for salons or services',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              CarouselSlider(),
              SizedBox(height: 16),
              SalonListItem(
                name: 'Glamour Hair & Beauty',
                address: '123 Main Street, Anytown',
                rating: 4.5,
                imagePath: 'assets/images/logo_1.png',
              ),
              SalonListItem(
                name: 'The Nail Bar',
                address: '456 Oak Avenue, Anytown',
                rating: 4.8,
                imagePath: 'assets/images/logo_2.png',
              ),
              SalonListItem(
                name: 'Serenity Spa & Salon',
                address: '789 Pine Lane, Anytown',
                rating: 4.9,
                imagePath: 'assets/images/logo_3.png',
              ),
              SalonListItem(
                name: 'Jah Spa & Salon',
                address: '789 Pine Lane, Anytown',
                rating: 4.9,
                imagePath: 'assets/images/logo_4.png',
              ),
              SalonListItem(
                name: 'PEPSI Spa & Salon',
                address: '789 Pine Lane, Anytown',
                rating: 4.9,
                imagePath: 'assets/images/logo_5.png',
              ),
              SalonListItem(
                name: 'PEPSI Spa & Salon',
                address: '789 Pine Lane, Anytown',
                rating: 4.9,
                imagePath: 'assets/images/logo_6.png',
              ),
              SalonListItem(
                name: 'PEPSI Spa & Salon',
                address: '789 Pine Lane, Anytown',
                rating: 4.9,
                imagePath: 'assets/images/logo_7.png',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.bookings);
        },
        backgroundColor: Colors.orange[800],
        child: const Icon(Icons.calendar_today, color: Colors.white),
      ),
    );
  }
}
