import 'package:flutter/material.dart';
import 'package:my_booking_app/views/login_page.dart';
import 'package:my_booking_app/views/main_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case home:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}

