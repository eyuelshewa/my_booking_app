import 'package:flutter/material.dart';
import 'package:my_booking_app/views/bookings_page.dart';
import 'package:my_booking_app/views/login_page.dart';
import 'package:my_booking_app/views/details_page.dart';
import 'package:my_booking_app/views/main_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String bookings = '/bookings';
  static const String details = '/details';

  static const List<String> salonNames = [
    'Glamour Hair & Beauty',
    'The Nail Bar',
    'Serenity Spa & Salon',
    'Jah Spa & Salon',
    'PEPSI Spa & Salon',
  ];

  static final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    home: (context) => const MainScreen(),
    bookings: (context) => const BookingsPage(places: salonNames),
    details: (context) => const DetailsPage(),
  };
}
