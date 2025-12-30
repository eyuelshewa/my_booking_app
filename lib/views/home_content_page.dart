import 'package:flutter/material.dart';
import 'package:my_booking_app/widgets/carousel_slider.dart';
import 'package:my_booking_app/widgets/salon_list_item.dart';

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                'Find a salon',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Near you',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for salons or services',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16),
              const CarouselSlider(),
              const SizedBox(height: 16),
              const SalonListItem(
                name: 'Glamour Hair & Beauty',
                address: '123 Main Street, Anytown',
                rating: 4.5,
                imagePath: 'assets/images/logo_1.png',
              ),
              const SalonListItem(
                name: 'The Nail Bar',
                address: '456 Oak Avenue, Anytown',
                rating: 4.8,
                imagePath: 'assets/images/logo_2.png',
              ),
              const SalonListItem(
                name: 'Serenity Spa & Salon',
                address: '789 Pine Lane, Anytown',
                rating: 4.9,
                imagePath: 'assets/images/logo_3.png',
              ),
              const SalonListItem(
                name: 'Jah Spa & Salon',
                address: '789 Pine Lane, Anytown',
                rating: 4.9,
                imagePath: 'assets/images/logo_4.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
